# 
# 
# 
# 
#

class OSMObject

	attr_reader :id, :user_id, :user_name, :created_at

	def initialize(args)
		@id         = args[:id]
		@user_id    = args[:user_id]
		@user_name  = args[:user_name]
		@created_at = args[:created_at]
		@tags       = args[:tags]

		post_initialize(args)
	end

	def post_initialize(args)
		nil
	end
end

class Node < OSMObject

	attr_reader :lat, :lon

	def initialize(args)  # Should this be post_initialize? What's the 
		@lon = args[:lon] #  benefits/cons of super vs. post_initialize?
		@lat = args[:lat]
		super(args)
	end
end

class Way < OSMObject

	attr_reader :nodes

	def initialize(args)
		@nodes = args[:nodes]
	end
end

class Relation < OSMObject
	def initialize(args)
		@nodes = args[:nodes]
		@ways  = args[:ways]
	end
end

class Changeset < OSMObject

	def initialize(args)
		@comment   = args[:comment]
		@closed_at = args[:closed_at]
		@open      = args[:open]
	end

end

class User # => Do we inherit anything here? No... ?
	attr_reader :user_name, :user_id, :join_date

	def initialize(args)
		@user_id   = args[:user_id]
		@user_name = args[:user_name]
		@join_date = args[:join_date]
	end

end

class Note # => Lots to learn here
	attr_reader :user_id, :user_name, :created_at

	def initialize(args)
		nil
	end
end