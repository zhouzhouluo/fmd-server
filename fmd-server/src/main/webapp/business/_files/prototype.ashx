// JavaScript prototype extensions

Object.extend = function(dest, source) {
	for(prop in source) {
		dest[prop] = source[prop];
	}
	return dest;
}

Object.extend(Function.prototype, {
	getArguments: function() {
		var args = [];
		for(var i=0; i<this.arguments.length; i++)
			args.push(this.arguments[i]);
		return args;
	},
	bind: function(o) {
		if(!window.__objs) {
			window.__objs = [];
			window.__funcs = [];
		}

		var objId = o.__oid;
		if(!objId)
			__objs[objId = o.__oid = __objs.length] = o;

		var me = this;
		var funcId = me.__fid;
		if(!funcId)
			__funcs[funcId = me.__fid = __funcs.length] = me;

		if(!o.__closures)
			o.__closures = [];

		var closure = o.__closures[funcId];
		if(closure)
			return closure;

		o = null;
		me = null;

		return __objs[objId].__closures[funcId] = function() {
			return __funcs[funcId].apply(__objs[objId], arguments);
		};
	},
	bindAsEventListener: function(o) {
		if(!window.__objs) {
			window.__objs = [];
			window.__funcs = [];
		}

		var objId = o.__oid;
		if(!objId)
			__objs[objId = o.__oid = __objs.length] = o;

		var me = this;
		var funcId = me.__fid;
		if(!funcId)
			__funcs[funcId = me.__fid = __funcs.length] = me;

		if(!o.__closures)
			o.__closures = [];

		var closure = o.__closures[funcId];
		if(closure)
			return closure;

		o = null;
		me = null;
		
		return __objs[objId].__closures[funcId] = function(event) {
			return __funcs[funcId].call(__objs[objId], event || window.event);
		};
	},
	bindToEvent: function(ele, evt, obj, useCapture) {
		if(useCapture == "undefined") useCapture = false;
		if(ele.attachEvent) {
			ele.attachEvent("on" + evt, this.bindAsEventListener(obj));
		}else if(ele.addEventListener) {
			ele.addEventListener(evt, this.bindAsEventListener(obj), useCapture);
		}
	},
	removeFromEvent: function(ele, evt, obj, useCapture) {
		if(useCapture == "undefined") useCapture = false;
		if(ele.detachEvent) {
			ele.detachEvent("on" + evt, this.bindAsEventListener(obj));
		}else if(ele.removeEventListener) {
			ele.removeEventListener(evt, this.bindAsEventListener(obj), useCapture);
		}
	}
}, false);

Function.isFunction = function(f) {
	if(f != null && typeof f == "function")
		return true;
	return false;
}

Object.extend(String.prototype, {
	endsWith: function(s) {
		return (this.substr(this.length - s.length) == s);
	},
	startsWith: function(s) {
		return (this.substr(0, s.length) == s);
	},
	trimLeft: function() {
		return this.replace(/^\s*/,"");
	},
	trimRight: function() {
		return this.replace(/\s*$/,"");
	},
	trim: function() {
		return this.trimRight().trimLeft();
	}
}, false);

String.format = function(s) {
	for(var i=1; i<arguments.length; i++) {
		s = s.replace("{" + (i -1) + "}", arguments[i]);
	}
	return s;
}

String.isNullOrEmpty = function(s) {
	if(s == null || s.length == 0)
		return true;
	return false;
}

Object.extend(Array.prototype, {
	push: function(o) {
		this[this.length] = o;
	}
}, false);

// JavaScript namespaces

if(!window.addNamespace) {
	window.addNamespace = function(ns) {
		var nsParts = ns.split(".");
		var root = window;

		for(var i=0; i<nsParts.length; i++) {
			if(typeof root[nsParts[i]] == "undefined")
				root[nsParts[i]] = {};
			root = root[nsParts[i]];
		}
	}
}

// Browser related properties

addNamespace("MS.Browser");
MS.Browser.isIE = (window.navigator.appName.toLowerCase().indexOf('explorer') != -1 || window.navigator.appName.toLowerCase().indexOf('msie') != -1 );
if(window.navigator.userAgent.toLowerCase().indexOf('opera') != -1) MS.Browser.isIE = false;

// Debugging

addNamespace("MS.Debug");
MS.Debug.enabled = false;
MS.Debug.trace = function(s){}

var Class = {
	create: function() {
		return function() {
			if(typeof this.initialize == "function")
				this.initialize.apply(this, arguments);
		}
	}
}

addNamespace("MS.Position");
MS.Position = {
	getLocation: function(ele) {
		var offsetX = 0;
		var offsetY = 0;
		var parent;

		for(parent=ele; parent; parent=parent.offsetParent) {
			if(parent.offsetLeft)
				offsetX += parent.offsetLeft;
			if(parent.offsetTop)
				offsetY += parent.offsetTop;
		}

		return {left:offsetX,top:offsetY};
	},
	getBounds: function(ele) {
		var offset = MS.Position.getLocation(ele);
		var width = ele.offsetWidth;
		var height = ele.offsetHeight;

		return {left:offset.left, top:offset.top, width:width, height:height};
	}
};

function addEvent(o, evType, f, capture) {
	if(o.addEventListener) {
		o.addEventListener(evType, f, capture);
		return true;
	} else if (o.attachEvent) {
		var r = o.attachEvent("on" + evType, f);
		return r;
	} else {
		// alert("Handler could not be attached");
	}
} 

function removeEvent(o, evType, f, capture) {
	if(o.removeEventListener) {
		o.removeEventListener(evType, f, capture);
		return true;
	} else if (o.detachEvent) {
		o.detachEvent("on" + evType, f);
	} else {
		// alert("Handler could not be removed");
	}
}

function $() {
  var elements = new Array();

  for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof element == 'string')
      element = document.getElementById(element);

    if (arguments.length == 1)
      return element;

    elements.push(element);
  }

  return elements;
}
