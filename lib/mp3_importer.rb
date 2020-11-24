class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
        files
    end

    def files
        data = Dir.glob("#{path}/*.mp3")
        #what does g stand for in gsub
        data.map {|string| string.gsub("#{path}/", "")}
        # Dir.entries(path)
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end


end