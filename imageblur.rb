class Image
    
    def initialize(picture)
       @image = picture 
       @ones = []
    end
     
    def find_pixels
        @image.each_with_index do |row,arrindex|
            row.each_with_index do |number,numindex|
                if number == 1
                    @ones << [arrindex, numindex]
                end
            end
        end 
    end
    
    def blur 
        @ones.each_with_index do |coordinates, index|
            #(arrindex, numindex+1) right   
            @image[coordinates.first][coordinates.last+1] =1 
            
            #(arrindex, numindex-1) left
            @image[coordinates.first][coordinates.last-1] =1
                       
            #(arrindex-1, numindex) top
            @image[coordinates.first-1][coordinates.last] =1
     
            #(arrindex+1, numindex) bottom
            @image[coordinates.first+1][coordinates.last] =1
    end
    puts @image.join
    
end
        

    def output_image
        @image.each do |row|
        puts row.join
        end
    end
    
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])


image.find_pixels
image.blur