/**
 * @namespace WORKAREA.sortDocuments
 */
WORKAREA.registerModule('sortDocuments', (function () {
    'use strict';

    var findDocumentPositions = function (event) {
            var result = {},
                $documents = $('[data-sort-document-id]', event.target);

            $documents.each(function (index, menu) {
                var id = $(menu).data('sortDocumentId');

                if (id) {
                    result['positions[' + id + ']'] = index;
                }
            });

            return result;
        },

        saveSort = function (event) {
            var productId = $(event.target)
                                .closest('[data-sort-document]')
                                .data('productId'),

                url = WORKAREA.routes.admin.moveCatalogProductDocumentsPath(
                    { catalog_product_id: productId }
                );

            $.post(url, findDocumentPositions(event));
        },

        setCellWidth = function (event, ui) {
            $('td', ui.item).each(function (index, cell) {
                $(cell).width($(cell).width());
            });

            return ui;
        },

        resetCellWidth = function (event, ui) {
            $('td', ui.item).each(function (index, cell) {
                $(cell).width('auto');
            });

            return ui;
        },

        /**
         * @method
         * @name init
         * @memberof WORKAREA.sortDocuments
         */
        init = function ($scope) {
            $('[data-sort-document]', $scope).sortable({
                axis: 'y',
                update: saveSort,
                tolerance: 'pointer',
                helper: setCellWidth,
                stop: resetCellWidth
            });
        };

    return {
        init: init
    };
}()));
