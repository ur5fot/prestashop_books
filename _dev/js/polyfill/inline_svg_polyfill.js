/**
 * Testing method for inline svg support
 *
 * @return boolean
 */
function hasInlineSvg() {
    var div = document.createElement('div');
    div.innerHTML = '<svg/>';
    return (div.firstChild && div.firstChild.namespaceURI) == 'http://www.w3.org/2000/svg';
}
/**
 * Compatibility check(s) method which supports following functionalities:
 * - fallback for browsers that don't support inline svg
 */
(function doCompatibilityChecks() {

    if (!hasInlineSvg()) {
        var svgElms = document.querySelectorAll('svg');
        Array.prototype.forEach.call(svgElms, function(aNode, aIndex, aNodeList) {
            // let's work on a temp Node, thus be friendly to the current DOM
            var tmpNode = aNode.cloneNode(true);
            var xmlns = tmpNode.getAttribute('xmlns');
            if (!xmlns) { //we need a namespace if not set
                tmpNode.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
            }

            // Serialize any native DOM node to an XML string
            // (including nodes from HTML documents)
            var elmTxt = (new XMLSerializer()).serializeToString(tmpNode);
            // Create a base-64 encoded ASCII string from a string of binary data.
            var escapedHtmlElement = window.btoa(elmTxt);
            var replacement = document.createElement("img");
            replacement.alt = "";
            replacement.src = "data:image/svg+xml;base64,"+escapedHtmlElement+"";
            var w = tmpNode.getAttribute('width');
            if (w) {
                replacement.width = parseInt(w);
            }
            var h = tmpNode.getAttribute('height');
            if (h) {
                replacement.height = parseInt(h);
            }
            // replace the current svg Node
            aNode.parentNode.replaceChild(replacement, aNode);
            // cleanup our leftovers (and free up some memory)
            tmpNode = replacement = escapedHtmlElement = null;
        });
        svgElms = null;
    }
})()
