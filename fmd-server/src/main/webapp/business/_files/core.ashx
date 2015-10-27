addNamespace("AjaxPro");

Object.extend(AjaxPro, {
	noOperation: function() {},
	cryptProvider: null,
	queue: null,
	token: "",
	version: "6.5.9.1",
	ID: "AjaxPro",
	noActiveX: false,
	timeoutPeriod: 5000,
	queue: null,

	typeOf: function(o) {
		if(o != null && o.__type) {
			var ts = this.__type.split(',');

			if(ts.length > 0)
				return ts[0];
			else
				return typeof o;

		} else {
			return typeof o;
		}
	},
	getInstance: function(className, o) {
		if(o == null) o = window;
		var c = className.split(".");	
		if(c.length > 1)
			return AjaxPro.getInstance(className.substr(className.indexOf(".") +1), o[c[0]]);
		return o[className];
	},
	toJSON: function(o) {

		if(o == null)
			return "null";

		switch(o.constructor) {
		
			case String:
				var s = o; // .encodeURI();
				s = '"' + s.replace(/(["\\])/g, '\\$1') + '"';
				s = s.replace(/\n/g,"\\n");
				s = s.replace(/\r/g,"\\r");
				return s;
		
			case Array:
				var v = [];
				for(var i=0; i<o.length; i++)
					v.push(AjaxPro.toJSON(o[i])) ;
				return "[" + v.join(",") + "]";
		
			case Number:
				return isFinite(o) ? o.toString() : AjaxPro.toJSON(null);
	
			case Boolean:
				return o.toString();
			
			case Date:
				var d = new Object();
				d.__type = "System.DateTime";
				d.Year = o.getUTCFullYear();
				d.Month = o.getUTCMonth() +1;
				d.Day = o.getUTCDate();
				d.Hour = o.getUTCHours();
				d.Minute = o.getUTCMinutes();
				d.Second = o.getUTCSeconds();
				d.Millisecond = o.getUTCMilliseconds();
				d.TimezoneOffset = o.getTimezoneOffset();
				return AjaxPro.toJSON(d);
	
			default:
				if(o["toJSON"] != null && typeof o["toJSON"] == "function")
					return o.toJSON();
				
				if(typeof o == "object") {
					var v=[];
				
					for(attr in o) {
						if(typeof o[attr] != "function")
							v.push('"' + attr + '":' + AjaxPro.toJSON(o[attr]));
					}

					if(v.length>0)
						return "{" + v.join(",") + "}";
					else
						return "{}";		
				}
				return o.toString();
		}
	}
});

AjaxPro.IFrameXmlHttp = Class.create();
AjaxPro.IFrameXmlHttp.prototype = {
	onreadystatechange: null, headers: [], method: "POST", url: null, async: true, iframe: null,
	status: 0, readyState: 0, responseText: null,
	abort: function() {
	},
	readystatechanged: function() {
		var doc = this.iframe.contentDocument || this.iframe.document;
		if(doc.readyState == "complete") {
			this.status = 200;
			this.readyState = 4;
			this.responseText = doc.body.res;
			this.onreadystatechange();
			return;
		}
		setTimeout(this.readystatechanged.bind(this), 1);
	},
	open: function(method, url, async) {
		if(async == false) {
			alert("Synchronous call using IFrameXMLHttp is not supported.");
			return;
		}
		if(this.iframe == null) {
			var iframeID = "hans";
			if (document.createElement && document.documentElement &&
				(window.opera || navigator.userAgent.indexOf('MSIE 5.0') == -1))
			{
				var ifr = document.createElement('iframe');
				ifr.setAttribute('id', iframeID);
				ifr.style.visibility = 'hidden';
				ifr.style.position = 'absolute';
				ifr.style.width = ifr.style.height = ifr.borderWidth = '0px';

				this.iframe = document.getElementsByTagName('body')[0].appendChild(ifr);
			}
			else if (document.body && document.body.insertAdjacentHTML)
			{
				document.body.insertAdjacentHTML('beforeEnd', '<iframe name="' + iframeID + '" id="' + iframeID + '" style="border:1px solid black;xdisplay:none"></iframe>');
			}
			if (window.frames && window.frames[iframeID]) this.iframe = window.frames[iframeID];
			this.iframe.name = iframeID;
			this.iframe.document.open();
			this.iframe.document.write("<html><body></body></html>");
			this.iframe.document.close();
		}
		this.method = method;
		this.url = url;
		this.async = async;
	},
	setRequestHeader: function(name, value) {
		for(var i=0; i<this.headers.length; i++) {
			if(this.headers[i].name == name) {
				this.headers[i].value = value;
				return;
			}
		}
		this.headers.push({"name":name,"value":value});
	},
	getResponseHeader: function(name, value) {
		return null;
	},
	addInput: function(doc, form, name, value) {
		var ele;
		var tag = "input";
		if(value.indexOf("\n") >= 0) tag = "textarea";
		
		if(doc.all) {
			ele = doc.createElement("<" + tag + " name=\"" + name + "\" />");
		}else{
			ele = doc.createElement(tag);
			ele.setAttribute("name", name);
		}
		ele.setAttribute("value", value);
		form.appendChild(ele);
		ele = null;
	},
	send: function(data) {
		if(this.iframe == null) {
			// alert("Connection must be opened before sending data.");
			return;
		}
		var doc = this.iframe.contentDocument || this.iframe.document;
		var form = doc.createElement("form");
		
		doc.body.appendChild(form);
		
		form.setAttribute("action", this.url);
		form.setAttribute("method", this.method);
		
		for(var i=0; i<this.headers.length; i++) {
			switch(this.headers[i].name.toLowerCase()) {
				case "content-length":
				case "accept-encoding":
					break;
				case "content-type":
					form.setAttribute("enctype", this.headers[i].value);
					break;
				default:
					this.addInput(doc, form, this.headers[i].name, this.headers[i].value);
			}
		}
		this.addInput(doc, form, "data", data);
		form.submit();
		setTimeout(this.readystatechanged.bind(this), 1);
	}
};

// IE compatibility methods

if(!window.XMLHttpRequest) {
	window.XMLHttpRequest = function() {
		var xmlHttp = null;
		if(!AjaxPro.noActiveX) {
			var clsids = ["Msxml2.XMLHTTP.4.0", "MSXML2.XMLHTTP", "Microsoft.XMLHTTP"];
			for(var i=0; i<clsids.length && xmlHttp == null; i++) {
				try {
					xmlHttp = new ActiveXObject(clsids[i]);
				} catch(e){}
			}
		}
		if(xmlHttp == null && MS.Browser.isIE) {
			return new AjaxPro.IFrameXmlHttp();
		}
		return xmlHttp;
	}
}

// Ajax.NET Professional Request and Queue

AjaxPro.Request = Class.create();
AjaxPro.Request.prototype = {
	url: null,
	callback: null,
	onLoading: null,
	onError: null,
	onTimeout: null,
	onStateChanged: null,
	args: null,
	context: null,
	isRunning: false,
	abort: function() {
		this.xmlHttp.onreadystatechange = AjaxPro.noOperation;
		this.xmlHttp.abort();
		
		this.isRunning = false;
	},
	doStateChange: function() {
		if(this.onStateChanged != null && typeof this.onStateChanged == "function")
			try{ this.onStateChanged(this.xmlHttp.readyState, this); }catch(e){}

		if(this.xmlHttp.readyState != 4)
			return;

		if(this.xmlHttp.status == 200) {
			this.duration = new Date().getTime() - this.__start;

			if(this.timeoutTimer != null) clearTimeout(this.timeoutTimer);
			if(typeof this.onLoading == "function") this.onLoading(false);
			
			var res = this.createResponse();
			
			this.abort();

			if(res.error != null && typeof this.onError == "function")
				try{ this.onError(res.error, this); }catch(e){}
			
			if(typeof this.callback == "function")
				this.callback(res, this);
		} else {
			var res = this.createResponse(true);

			res.error = {Message:this.xmlHttp.statusText,Type:"ConnectFailure",Status:this.xmlHttp.status};

			this.abort();
			
			if(res.error != null && typeof this.onError == "function")
				try{ this.onError(res.error, this); }catch(e){}
			
			if(typeof this.callback == "function")
				this.callback(res, this);
		}
	},
	initialize: function(url) {
		if(url != null) this.url = url;
		this.xmlHttp = null;
	},
	createResponse: function(noContent) {
		var r = new Object();
		r.error = null;
		r.value = null;
		r.request = {method:this.method,args:this.args};
		r.context = this.context;

		if(MS.Debug.enabled == true)
			MS.Debug.trace("... " + this.method + " finished.");
		
		if(!noContent) {
			var responseText = new String(this.xmlHttp.responseText);

			if(AjaxPro.cryptProvider != null && typeof AjaxPro.cryptProvider == "function")
				responseText = AjaxPro.cryptProvider.decrypt(responseText);

			if(this.xmlHttp.getResponseHeader("Content-Type") == "text/xml")
				r.value = this.xmlHttp.responseXML;
			else
				if(responseText != null && responseText.trim().length > 0) {
					eval("r.value = " + responseText + ";");
				}
		}
		
		// Mozilla/Firefox bug, if the header does not exists the browser will 
		// throw an exception.
		/*
		if(this.xmlHttp.getResponseHeader(AjaxPro.ID + "-Cache") == "server") {
			r.isCached = true;
		}
		*/

		return r;
	},
	timeout: function() {
		this.duration = new Date().getTime() - this.__start;
		this.abort();

		try{ this.onTimeout(this.duration, this); }catch(e){}
	},
	invoke: function(method, args, callback, context) {
		this.__start = new Date().getTime();

		if(this.xmlHttp == null)
			this.xmlHttp = new XMLHttpRequest();

		this.isRunning = true;
		this.method = method;
		this.args = args;
		this.callback = callback;
		this.context = context;
		
		if(MS.Debug.enabled == true)
			MS.Debug.trace("Invoking " + method + "...");

		var async = typeof callback == "function" && callback != AjaxPro.noOperation;
		var json = AjaxPro.toJSON(args) + "";

		if(AjaxPro.cryptProvider != null)
			json = AjaxPro.cryptProvider.encrypt(json);
			
		if(async) {
			this.xmlHttp.onreadystatechange = this.doStateChange.bind(this);
			if(typeof this.onLoading == "function") this.onLoading(true);
		}

		this.xmlHttp.open("POST", this.url, async);
		this.xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		this.xmlHttp.setRequestHeader(AjaxPro.ID + "-Method", method);
		
		if(AjaxPro.token != null && AjaxPro.token.length > 0)
			this.xmlHttp.setRequestHeader(AjaxPro.ID + "-Token", AjaxPro.token);

		if(MS.Browser.isIE)
			this.xmlHttp.setRequestHeader("Accept-Encoding", "gzip, deflate");
		else
			this.xmlHttp.setRequestHeader("Connection", "close");		// Mozilla Bug #246651

		if(this.onTimeout != null && typeof this.onTimeout == "function")
			this.timeoutTimer = setTimeout(this.timeout.bind(this), AjaxPro.timeoutPeriod);

		this.xmlHttp.send(json);
		
		json = null;
		args = null;
		delete json;
		delete args;
		
		if(!async) {
			return this.createResponse();
		}
		
		return true;	
	}
};

AjaxPro.RequestQueue = Class.create();
AjaxPro.RequestQueue.prototype = {
	process: function() {
		this.timer = null;
		if(this.queue.length == 0) return;

		for(var i=0; i<this.requests.length && this.queue.length > 0; i++) {
			if(this.requests[i].isRunning == false) {
				var r = this.queue.shift();
				this.requests[i].url = r[0];
				this.requests[i].onLoading = r[3].length >2 && r[3][2] != null && typeof r[3][2] == "function" ? r[3][2] : AjaxPro.onLoading;
				this.requests[i].onError = r[3].length >3 && r[3][3] != null && typeof r[3][3] == "function" ? r[3][3] : AjaxPro.onError;
				this.requests[i].onTimeout = r[3].length >4 && r[3][4] != null && typeof r[3][4] == "function" ? r[3][4] : AjaxPro.onTimeout;
				this.requests[i].onStateChanged = r[3].length >5 && r[3][5] != null && typeof r[3][5] == "function" ? r[3][5] : AjaxPro.onStateChanged;
				if(MS.Debug.enabled == true)
					MS.Debug.trace("Using http connection " + i + " for method " + r[1] + " (" + this.queue.length + " waiting).");
				this.requests[i].invoke(r[1], r[2], this.requests[i].callbackHandle, r);
				r = null;
			}
		}
		if(this.queue.length > 0 && this.timer == null) {
			this.timer = setTimeout(this.process.bind(this), 100);
		}
	},
	initialize: function() {
		this.queue = [];
		this.requests = [];
		this.timer = null;

		for(var i=0; i<2; i++) {		// max 2 http connections
			this.requests[i] = new AjaxPro.Request();
			this.requests[i].callback = function(res) {
				var r = res.context;
				res.context = r[3][1];
				try {
					r[3][0](res, this);
				}catch(e){alert(e.description);}
			};
			this.requests[i].callbackHandle = this.requests[i].callback.bind(this.requests[i]);
		}
	},
	add: function(url, method, args, e) {
		this.queue.push([url, method, args, e]);
		if(MS.Debug.enabled == true)
			MS.Debug.trace(method + " added to queue");
		if(this.timer == null) {
			this.timer = setTimeout(this.process.bind(this), 1);
		}
	},
	abort: function() {
		this.queue.length = 0;
		if (this.timer != null) {
			clearTimeout(this.timer);
		}
		this.timer = null;
		for(var i=0; i<this.requests.length; i++) {
			if(this.requests[i].isRunning == true) {
				this.requests[i].abort();
			}
		}
	}
};

AjaxPro.queue = new AjaxPro.RequestQueue();

AjaxPro.AjaxClass = Class.create();
AjaxPro.AjaxClass.prototype = {
	initialize: function(url) {
		this.url = url;
	},
	invoke: function(method, args, e) {
		if(e != null) {
			if(e.length != 6) for(;e.length<6;) e.push(null);
			if(e[2] == null) e[2] = this.onLoading;
			if(e[3] == null) e[3] = this.onError;
			if(e[4] == null) e[4] = this.onTimeout;
			if(e[5] == null) e[5] = this.onStateChanged;
			if(e[0] != null && typeof e[0] == "function") {
				return AjaxPro.queue.add(this.url, method, args, e);
			}
		}
		var r = new AjaxPro.Request();
		r.url = this.url;
		r.onLoading = this.onLoading != null && typeof this.onLoading == "function" ? this.onLoading : AjaxPro.onLoading;
		r.onError = this.onError != null && typeof this.onError == "function" ? this.onError : AjaxPro.onError;
		r.onTimeout = this.onTimeout != null && typeof this.onTimeout == "function" ? this.onTimeout : AjaxPro.onTimeout;
		r.onStateChanged = this.onStateChanged != null && typeof this.onStateChanged == "function" ? this.onStateChanged : AjaxPro.onStateChanged;
		return r.invoke(method, args);
	}
};
