class GlobalSearchService
  attr_reader :query

  def initialize(query)
    @query = query
  end

  def call
    initial_data = PgSearch.multisearch(query).includes(:searchable)
    return {} if initial_data.empty?

    group_by_class(initial_data)
  end

  private

  def group_by_class(initial_data)
    initial_data.group_by(&:searchable_type)
  end
end
