class Entry < ActiveRecord::Base

	scope :get_entries_by_user, lambda {|query|
	  where(["user_id LIKE ?", "#{query}"])
	}

end
