class Product < ActiveRecord::Base
	has_many :orders
  has_many :likes
	# Adapted from Learning Rails 3

  # call the store_photo method after the database record has been saved.
  after_save :store_photo

  # sets the directory name of where the images are stored. The
  # join utility concatenates the file name segments specific to the platform
  # (e.g. windows uses back-slashes to connect filename segments) 
  PHOTO_STORE = Rails.root.join 'public', 'photo_store'

  # allows a controller to assign the file_data to the photo field
  # 'photo' will serve as a virtual attribute for the data model
  def photo=(file_data)
    unless file_data.blank?
      @file_data = file_data 
      self.extension = file_data.original_filename.split('.').last.downcase
    end
  end

  # get the file name based on the record's id and the image extension
  def photo_filename
    File.join PHOTO_STORE, "#{id}.#{extension}"
  end

  # get the location of the photo so that it can be referenced in a view
  def photo_path
    "/photo_store/#{id}.#{extension}"
  end

  def has_photo?
    File.exists? photo_filename
  end

private

  # this utility method actually saves the image's data to the file
  def store_photo
    if @file_data
      # create folder if it doesn't exist yet
      FileUtils.mkdir_p PHOTO_STORE
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end

      # prevents saving the same image twice
      @file_data = nil
    end
  end
end
