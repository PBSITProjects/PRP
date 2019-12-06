class Region < ApplicationRecord

  scope :by_area, -> (area) {where('area = ?',area).order("region_number ASC")}

  def self.get_desc(r_code)
	#Pre Fill the array to cache the information in order to speed up subsequent calls
	@regions_by_code ||= Region.select(:region_id, :region_number, :description).map {|e| e.attributes.values}.inject({})  {|memo, misc| memo[misc[1]] = misc[3]; memo}
    return @regions_by_code[r_code] if @regions_by_code[r_code]
    result = Region.select("description").where("region_id = ?", r_code)
	return @regions_by_code[r_code] = result[0].description
  end
end