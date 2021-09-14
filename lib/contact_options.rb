class ContactOptions
  attr_accessor :name, :email, :intros_offered, :first_name, :last_name

  CONTACTS = [
    {
      name: 'John Doe',
      email: 'john@brdg.app',
      introsOffered: {free: 3, vip: 0}
    },
    {
      name: 'Billy Ray Jenkins',
      email: 'billy.jenkins@gmail.com',
      introsOffered: {free: 5, vip: 0}
    },
    {
      name: 'Jenny Baggins',
      email: 'jeni@x.com',
      introsOffered: {free: 5, vip: 1}
    },
    {
      name: 'Lloyd Banks',
      email: 'lloyd@banks.com',
      introsOffered: {free: 0, vip: 0}
    },
    {
      name: 'BA Lewis',
      email: 'ba.lewis@outlook.com',
      introsOffered: {free: 8, vip: 0}
    },
    {
      name: 'John Johnson',
      email: 'jj@z.com',
      introsOffered: {free: 4, vip: 0}
    },
    {
      name: 'Adam Johnson',
      email: 'aj@z.com',
      introsOffered: {free: 4, vip: 0}
    },
    {
      name: 'Joey Simpson',
      email: 'joey@hotmail.com',
      introsOffered: {free: 9, vip: 1}
    },
    {
      name: 'Penny Smith',
      email: 'penny@smith.com',
      introsOffered: {free: 2, vip: 0}
    }
  ]

  def initialize(attributes)
    @name = attributes[:name]
    @email = attributes[:email]
    @intros_offered = attributes[:introsOffered]||{ free: 0, vip: 0 }
    @first_name = @name.split.first
    @last_name = @name.split.last
  end

  def self.all
    CONTACTS.map { |contact| new(contact) }.sort_by { |contact| [contact.last_name, contact.first_name] }
  end

  def rank
    rank = 3
    rank += 1 if email.match(/gmail.com|hotmail.com|outlook.com/)
    rank += intros_offered[:free]
    rank += intros_offered[:vip]
    rank
  end

  def self.vip_not_offered
    all.select { |contact| contact.intros_offered[:vip].zero? }
  end

  def offer
    return "vip" if intros_offered[:vip].zero? && rank >= self.class.vip_not_offered.map(&:rank).max

    "free"
  end
end

