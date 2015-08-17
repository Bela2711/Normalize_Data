require "csv"
class UploadFile
attr_accessor :revenue
  def initialize(user_id)
    @user_id = user_id
    @revenue = 0
  end

  def save(file_data)
    csv = CSV.new(file_data.read,:headers => true,:header_converters => :symbol)
    file_data.rewind
    if csv.to_a[1].to_s.split("\t")[1].nil?
      puts "it is csv"
      parsed_file = CSV.new(file_data.read,:headers => true,:header_converters => :symbol)
    else
      puts "it is tsv"
      parsed_file = CSV.new(file_data.read, :headers => true,:header_converters => :symbol , :col_sep => "\t")
    end
    parsed_file.to_a.map{|row| 
       hashed_data = row.to_hash
       @revenue = @revenue + save_data(hashed_data)
    }
puts @revenue
  end

private
def save_data(hashed_data)
       purchaser = Purchaser.create(name: hashed_data[:purchaser_name])
       merchant = Merchant.create(name: hashed_data[:merchant_name],address: hashed_data[:merchant_address])
       item = Item.create(description: hashed_data[:item_description])
p_id = Purchaser.find_by_name(hashed_data[:purchaser_name]).id
m_id = Merchant.find_by_name(hashed_data[:merchant_name]).id
i_id = Item.find_by_description(hashed_data[:item_description]).id
order = Order.create(purchaser_id: p_id, item_id: i_id, count: hashed_data[:purchase_count].to_i, user_id: @user_id.to_i)
item_merchant = ItemsMerchant.create(item_id: i_id,merchant_id: m_id, price: hashed_data[:item_price])

hashed_data[:item_price].to_f * hashed_data[:purchase_count].to_i
end 
end
