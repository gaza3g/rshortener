class AddVisitorCountToLink < ActiveRecord::Migration
  def change
  	add_column :link, :visitors_count, :integer, default: 0

  	Link.find_each(select: 'id') do |result|
      Link.reset_counters(result.id, :visitors)
    end

  end

end
