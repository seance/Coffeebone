define ['underscore', 'backbone'], (_, Backbone) ->
	class FooView extends Backbone.View
		tagName: 'li'
		template:
			_.template $('#foo-tmpl').html()
		events:
			'click .foo': 'makeBar'
		initialize: =>
			@model.bind('change', @render)
		render: =>
			$(@el).html(@template(@model.toJSON())); @
		makeBar: =>
			@model.set {name: 'Bar'}
			@model.save()
	