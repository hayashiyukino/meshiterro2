class PostImage < ApplicationRecord
   has_one_attached :image
   belongs_to :user
   
  # ID:1のレコードを取得し、@post_imageに格納する
  @post_image = PostImage.find(1)

   
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
   end
  # @post_imageに含まれるイメージを表示させるメソッドを実行する
  # カラムのように、インスタンス変数の後に"."をつけて、その後にメソッド名を繋げる
  @post_image.get_image
  
   
end
