BoxenPackageView = require './boxen-package-view'

module.exports =
  activate: ->
    atom.workspaceView.command "boxen:add", => @convert()

  convert: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem

    github = require('octonode')
    client = github.client()
    ghsearch = client.search()


    repoArray = []
    ghsearch.repos({
      q: 'intellij user:boxen fork:true',
      sort: 'created',
      order: 'asc'
      }, (err, data, headers) ->
          console.log data.items[0]
          repoArray = data.items
          getTags(repoArray[0].full_name)
        );


    getTags = (repo) ->
      ghrepo = client.repo(repo);

      ghrepo.tags((err, data, headers) ->
        console.log data
        print data
      );

    print = (x) -> editor.insertText("github \"" + repoArray[0].name + "\", " + "\"" + x[0].name + "\"")


    # editor.insertText(callback)

# module.exports =
  # boxenPackageView: null

  # activate: (state) ->
    # @boxenPackageView = new BoxenPackageView(state.boxenPackageViewState)

  # deactivate: ->
  #   @boxenPackageView.destroy()

  # serialize: ->
  #   boxenPackageViewState: @boxenPackageView.serialize()
