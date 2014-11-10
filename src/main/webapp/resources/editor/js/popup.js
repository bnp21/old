var CORE_FILES = [
	"../../../../resources/editor/js/scopeVariable.js",
	/** common library */
	"../../../../resources/editor/js/lib/txlib.js",
	"../../../../resources/editor/js/lib/hyperscript.js",
	"../../../../resources/editor/js/lib/template.js",
	"../../../../resources/editor/js/lib/dgetty.js",
	"../../../../resources/editor/js/lib/xgetty.js",
	"../../../../resources/editor/js/lib/rubber.js",
	/** trex engine & config */
	"../../../../resources/editor/js/trex/trex.js",
	"../../../../resources/editor/js/trex/config.js",
	"../../../../resources/editor/js/trex/event.js",
	/** trex library */
	"../../../../resources/editor/js/trex/lib/markup.js",
	"../../../../resources/editor/js/trex/lib/domutil.js",
	"../../../../resources/editor/js/trex/lib/utils.js",
	/** trex mixins */
	"../../../../resources/editor/js/trex/mixins/ajax.js",
	"../../../../resources/editor/js/trex/mixins/observable.js",
	/** trex common */
	"../../../../resources/editor/js/popuputil.js"
];

try {
	var urlParams = {};
	(function () {
		var e,
			a = /\+/g,  // Regex for replacing addition symbol with a space
			r = /([^&=]+)=?([^&]*)/g,
			d = function (s) {
				return decodeURIComponent(s.replace(a, " "));
			},
			q = window.location.search.substring(1);

		while (e = r.exec(q))
			urlParams[d(e[1])] = d(e[2]);
	})();
	if (urlParams.xssDomain) {
		document.domain = urlParams.xssDomain;
	}
} catch (e) {
	// ignore error when loaded from build script
}

try {
	var basePath = opener.EditorJSLoader.getJSBasePath();
} catch (e) {
	// ignore error when loaded from build script
}

for (var i = 0; i < CORE_FILES.length; i++) {
	if (CORE_FILES[i]) {
		var src = basePath + CORE_FILES[i] + '?v=' + new Date().getTime();
		document.write('<script type="text/javascript" src="' + src + '" charset="utf-8"></script>');
	}
}