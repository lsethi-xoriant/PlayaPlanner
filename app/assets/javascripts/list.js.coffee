app = angular.module("PackingList", ["ngResource"])

app.factory "Item", ["$resource", ($resource) ->
	$resource("/items/:id", {id: "@id"}, {update: {method: "PUT"}, destroy: {method: "DELETE"}})
]

@ListCtrl = ["$scope", "Item", ($scope, Item) ->
	$scope.items = Item.query()

	indexedCategories = []

	$scope.addItem = (category, newItemName) ->
		item = Item.save({name: newItemName, category: category, necessity: true, default: false})
		$scope.items.push(item)

	$scope.checkItem = (item) ->
		item.checked = !item.checked
		item.$update()

	$scope.deleteItem = (item) ->
		item.$destroy()
		$scope.items.splice($scope.items.indexOf(item), 1);

	$scope.editItem = (item) ->
		item.editing = true
		item.$update()

	$scope.doneEditing = (item) ->
		item.$update()
		item.editing = false
		item.$update()

	$scope.itemsToFilter = ->
		indexedCategories = []
		return $scope.items

	$scope.filterCategories = (item) ->
		categoryIsNew = indexedCategories.indexOf(item.category) == -1
		if categoryIsNew
			indexedCategories.push(item.category)
		return categoryIsNew

]

app.directive 'listItem', ->
	restrict: 'C',
	link: (scope, element, attr) ->
		$('.item-information').mouseenter ->
			$(this).find('i.delete-task').css({'color': '#a94442'})

		$('.item-information').mouseleave ->
			$(this).find('i.delete-task').css({'color': '#FFF'})

		$('.item-information').on 'dblclick', ->
			$('.edit-item-input').focus()

app.directive 'addItemButton', ->
	restrict: 'C',
	link: (scope, element, attr) ->
		$('.add-item-button').click ->
			$(this).parents('.add-item-form').find("input[type='text']").val('')

