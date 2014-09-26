app = angular.module("PackingList", ["ngResource"])

app.factory "Item", ["$resource", ($resource) ->
	$resource("/items/:id", {id: "@id"}, {update: {method: "PUT"}, destroy: {method: "DELETE"}})
]

@ListCtrl = ["$scope", "Item", ($scope, Item) ->
	$scope.items = Item.query()

	indexedCategories = []

	$scope.addItem = ->
		item = Item.save($scope.newItem)
		$scope.items.push(item)
		$scope.newItem = {}

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

