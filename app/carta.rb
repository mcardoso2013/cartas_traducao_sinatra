require 'sqlite3'

class Carta
  $db = SQLite3::Database.open('cookbook.db')
  $db.results_as_hash = true

  attr_accessor :ingles, :portugues
  attr_reader :id, :created_at

  def initialize(id: nil, ingles:, portugues:, created_at: nil)
    @id = id
    @ingles = ingles
    @portugues = portugues
    @created_at = created_at
  end

  def self.busca(termo)
    $db.execute("SELECT * FROM cartas WHERE nome LIKE '#{termo}%'")
  end

  def self.create(nome, tipo)
    $db.execute("INSERT INTO cartas(ingles,portugues) VALUES(?,?)",
                ingles,
                portugues)
  end

  def self.all
    $db.execute(
      "SELECT * FROM cartas"
    ).map do |carta|
      Carta.new(id: carta['id'],
                ingles: carta['ingles'],
                portugues: carta['portugues'],
                created_at: carta['created_at'])
    end
  end

  def self.find(id)
    $db.execute(
      "SELECT * FROM cartas WHERE id = #{id} LIMIT 1"
    ).map do |carta|
      Carta.new(id: carta['id'],
                ingles: carta['ingles'],
                portugues: carta['portugues'],
                created_at: carta['created_at'])
    end.first
  end

  def save
    $db.execute(
      'INSERT INTO cartas (ingles, portugues) VALUES (?, ?)',
      [ingles, portugues]
    )
  end
end
