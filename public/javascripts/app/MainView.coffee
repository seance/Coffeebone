define ['backbone', 'cs!FooView'], (Backbone, FooView) ->
	class AppView extends Backbone.View
		constructor: (@foos) -> super
		el: $('#foo-app')
		events:
			'click #new-foo': 'makeFoo'
		initialize: =>
			@foos.bind('add', @addFoo)
			@foos.bind('reset', @addAll)
			@foos.bind('all', @render)
			@foos.fetch()
		render: (event) =>
			foos = @foos.foos().length
			bars = @foos.bars().length
			$('#foo-count').text("#{foos} foos and #{bars} bars")
		makeFoo: =>
			@foos.create()
		addFoo: (foo) =>
			view = new FooView {model: foo}
			$('#foo-list').append(view.render().el)
		addAll: =>
			@foos.each @addFoo