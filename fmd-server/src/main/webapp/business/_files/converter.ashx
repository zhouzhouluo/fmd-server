addNamespace("Ajax.Web");

Ajax.Web.NameValueCollection = function()
{
	this.__type = "System.Collections.Specialized.NameValueCollection";

	this.add = function(key, value) {
		if(this[key] == null) {
			this[key] = value;
		}
	}
	this.getKeys = function() {
		var keys = [];
		
		for(key in this)
			if(typeof this[key] != "function")
				keys.push(key);
			
		return keys;
	}
	this.getValue = function(key) {
		return this[key];
	}
	this.toJSON = function() {
		var o = this;
		o.toJSON = null;
		delete o.toJSON;
		return AjaxPro.toJSON(o);
	}
}


addNamespace("Ajax.Web");

Ajax.Web.DataSet = function(tables) {
	this.__type = "System.Data.DataSet, System.Data";
	this.Tables = new Array();

	this.addTable = function(table) {
		this.Tables.push(table);
	}

	if(tables != null) {
		for(var i=0; i<tables.length; i++) {
			this.addTable(tables[i]);
		}
	}
}

addNamespace("Ajax.Web");

Ajax.Web.DataTable = function(columns, rows) {
	this.__type = "System.Data.DataTable, System.Data";
	this.Columns = new Array();
	this.Rows = new Array();

	this.addColumn = function(name, type) {
		var c = new Object();
		c.Name = name;
		c.__type = type;
		
		this.Columns.push(c);
	}
	this.toJSON = function() {
		var dt = new Object();

		dt.Columns = [];
		for(var i=0; i<this.Columns.length; i++)
			dt.Columns.push([this.Columns[i].Name, this.Columns[i].__type]);

		dt.Rows = [];
		for(var i=0; i<this.Rows.length; i++) {
			var row = [];
			for(var j=0; j<this.Columns.length; j++)
				row.push(this.Rows[i][this.Columns[j].Name]);
			dt.Rows.push(row);
		}
		return AjaxPro.toJSON(dt);
	}
	this.addRow = function(row) {
		this.Rows.push(row);
	}

	if(columns != null) {
		for(var i=0; i<columns.length; i++) {
			this.addColumn(columns[i][0], columns[i][1]);
		}
	}
	if(rows != null) {
		for(var i=0; i<rows.length; i++) {
			var row = new Object();
			for(var c=0; c<this.Columns.length && c<rows[i].length; c++) {
				row[this.Columns[c].Name] = rows[i][c];
			}
			this.addRow(row);
		}
	}
}


addNamespace("Ajax.Web");

Ajax.Web.Profile = function() {
	this.toJSON = function() {
		throw "Ajax.Web.Profile cannot be converted to JSON format.";
	}
	this.setProperty_callback = function(res) {
	}
	this.setProperty = function(name, object) {
		this[name] = object;
		var o = new Object();
		o[name] = object;
		AjaxPro.Services.Profile.SetProfile(o, this.setProperty_callback.bind(this));
	}
}






