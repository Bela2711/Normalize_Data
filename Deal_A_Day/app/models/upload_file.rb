class UploadFile < ActiveRecord::Base
  def self.save(upload)
    #puts File.read(upload)
    #data =  String.read(upload['datafile'])
    #data = File.read(upload['datafile'])
    puts upload.read
    
  end
end
