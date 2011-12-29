define [
  'jquery',
  'cs!FooCollection',
  'cs!MainView'
], ($, FooCollection, MainView) ->
	$ ->
		new MainView(new FooCollection)
