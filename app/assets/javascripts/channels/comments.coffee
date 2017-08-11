App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $('#comments')

  connected: ->
    setTimeout =>
      @followCurrentArticle()
    , 1000

  disconnected: ->

  followCurrentArticle: ->
    articleId = @collection().data('article-id')
    if articleId
      @perform 'follow', article_id: articleId
    else
      @perform 'unfollow'

  received: (data) ->
    @collection().append(data['comment'])
