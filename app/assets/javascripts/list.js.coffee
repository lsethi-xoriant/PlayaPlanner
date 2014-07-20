app = angular.module("PackingList", ["ngResource"])

app.factory "Item", ["$resource", ($resource) ->
	$resource("/items/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@ListCtrl = ["$scope", "Item", ($scope, Item) ->
	$scope.items = Item.query()

	$scope.addItem = ->
		item = Item.save($scope.newItem)
		$scope.items.push(item)
		$scope.newItem = {}
]