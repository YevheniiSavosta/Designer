/* Progressively reveal rows in independent home-page selections. */
(function () {
    'use strict';

    function init(root) {
        if (root.dataset.homeProductsReady === '1') return;
        var grid = root.querySelector('.home-products__grid');
        var controls = root.querySelector('.home-products__controls');
        var button = root.querySelector('.fn_home_products_more');
        var status = root.querySelector('.fn_home_products_status');
        if (!grid || !controls || !button || !status) return;
        var items = Array.prototype.slice.call(grid.children).filter(function (item) {
            return item.classList.contains('home-products__item');
        });
        if (!items.length) return;
        var initialRows = Math.max(1, parseInt(root.dataset.initialRows, 10) || 2);
        var stepRows = Math.max(1, parseInt(root.dataset.stepRows, 10) || 2);
        var visible = 0;
        var resizeFrame = null;

        function columns() {
            return Math.max(1, parseInt(window.getComputedStyle(root).getPropertyValue('--home-products-columns'), 10) || 2);
        }
        function render() {
            visible = Math.min(items.length, visible);
            items.forEach(function (item, index) { item.hidden = index >= visible; });
            button.hidden = visible >= items.length;
            controls.hidden = visible >= items.length;
        }
        function updateForViewport() {
            // Resizing never hides products the visitor already revealed.
            visible = Math.max(visible, Math.min(items.length, columns() * initialRows));
            render();
        }
        button.addEventListener('click', function () {
            var firstNewIndex = visible;
            visible = Math.min(items.length, visible + columns() * stepRows);
            render();
            var added = visible - firstNewIndex;
            if (!added) return;
            status.textContent = status.dataset.addedLabel + ' ' + added + '.';
            // Keep keyboard navigation inside the newly revealed products.
            var focusTarget = items[firstNewIndex].querySelector('a[href], button:not([disabled])');
            if (focusTarget) focusTarget.focus({ preventScroll: true });
            // The existing LazyLoad IntersectionObserver notices newly visible images.
            // If LazyLoad is absent, promote the original data attributes as a fallback.
            if (typeof window.LazyLoad !== 'function') {
                items.slice(firstNewIndex, visible).forEach(function (item) {
                    item.querySelectorAll('picture source[data-srcset]').forEach(function (source) {
                        source.srcset = source.dataset.srcset;
                    });
                    item.querySelectorAll('img[data-src]').forEach(function (image) {
                        image.src = image.dataset.src;
                    });
                });
            }
        });
        window.addEventListener('resize', function () {
            if (resizeFrame !== null) window.cancelAnimationFrame(resizeFrame);
            resizeFrame = window.requestAnimationFrame(function () {
                resizeFrame = null;
                updateForViewport();
            });
        });
        root.dataset.homeProductsReady = '1';
        updateForViewport();
    }

    function start() {
        document.querySelectorAll('.fn_home_products').forEach(init);
    }
    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start, { once: true });
    else start();
}());
