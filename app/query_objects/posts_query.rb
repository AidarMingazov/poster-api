class PostsQuery
  def initialize(relation, page)
    @relation = relation
    @page = page
  end

  def all
    @relation
      .result(distinct: true)
      .includes(:user, :comments, :ratings)
      .order(created_at: :desc)
      .page(@page)
      .per(10)
  end
end
