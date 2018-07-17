class Inquiry
	include ActiveModel::Model

	attr_accessor :name, :email, :message

	validates :name, :presence => {:message =>'名前を入力してください'}
	validates :email, :presence => {:message =>'emailを入力してください'}
	
end