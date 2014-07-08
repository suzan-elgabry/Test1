class Library < ActiveRecord::Base
	validates :url, :format => URI::regexp
    validates :name, :presence =>true
    has_many :books
end
