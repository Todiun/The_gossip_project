require'csv'


class Gossip
  attr_accessor :author, :content  

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [author, content]  # insère l'auteur et le contenu du potin
    end
  end

  def self.all
    CSV.foreach("./db/gossip.csv").map do |author, content|
    Gossip.new(author, content)
    end
  end
  
  def self.find(id)
    row = CSV.read("./db/gossip.csv")[id]
    Gossip.new(row[0], row[1]) if row
  end
end