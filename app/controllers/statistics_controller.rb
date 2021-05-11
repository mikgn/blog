class StatisticsController < AdminController
  def index
    @posts = Post.order(comments_count: :desc).limit(10)
    # try plain SQL
    #
    # @posts = ActiveRecord::Base.connection.execute(
    #   "SELECT p \
    #    FROM posts p LEFT JOIN comments c \
    #    ON p.id=c.post_id \
    #    GROUP BY p.id \
    #    ORDER BY count(c) DESC \
    #    LIMIT 10;"
    # )
  end
end
