Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

# Create user method
@users = [
  {
    email: 'user@user.com',
    nickname: 'just user',
    role:  'user'
  }, {
    email: 'admin@admin.com',
    nickname: 'true admin',
    role:  'admin'
  }, {
    email: 'content@content.com',
    nickname: 'makes shit here',
    role:  'content'
  }
]

def create_users(user)
  password = 'testtest'
  # banned = user[:banned] ? user[:banned] :false

  User.create(
    email:                 user[:email],
    nickname:              user[:nickname],
    role:                  user[:role],
    password:              password,
    password_confirmation: password
  )
end

@users.each do |user|
  u = create_users(user)
  puts "User with #{u.email} created"
end


# Route info methods
# Create seasons
@seasons = [
  {
    title: 'лето'
  }, {
    title: 'осень'
  }, {
    title: 'зима'
  }, {
    title: 'весна'
  }
]

@seasons.each do |season|
  s = Season.create(season)

  if s.save
    puts "Season #{s.title} created"
  else
    puts "Season #{s.title} not created"
  end
end

# Create difficulty
@difficulties = [
  {
    level: 'лёгкая'
  }, {
    level: 'средняя'
  }, {
    level: 'сложная'
  }
]

@difficulties.each do |difficulty|
  d = Difficulty.create(difficulty)

  if d.save
    puts "Difficulty #{d.level} created"
  else
    puts "Difficulty #{d.level} not created"
  end
end

# Create route kind
@kinds = [
  {
    title: 'пеший'
  }, {
    title: 'вело'
  }
]

@kinds.each do |kind|
  k = Kind.create(kind)

  if k.save
    puts "Kind #{k.title} created"
  else
    puts "Kind #{k.title} not created"
  end
end


# Create collection method
@collections = [
  {
    title:       'походы МО',
    description: 'походы по Московской Области'
  }, {
    title:       'походы выходного дня',
    description: 'походы на выходных'
  }
]

@collections.each do |collection|
  c = Collection.create(collection)

  if c.save
    puts "Collection #{c.title} created"
  else
    puts "Collection #{c.title} not created"
  end
end

# Fake route covers
def upload_fake_route_cover
  uploader = CoverUploader.new(Route.new, :cover)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/route/covers', '*')).sample))
  uploader
end


# Create route method
@routes = [
  {
    user_id:       User.all.sample.id,
    title:        'Oкская тропа',
    description:  'Маршрут вдоль реки Оки, в прошлом главного судоходного тракта через старинные города и села, от Павлова до города Горбатов. Это первый этап будущего большого маршрута от Павлова до Нижнего Новгорода общей протяженностью в 130 км.',
    distance:      41000,
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       User.all.sample.id,
    title:        'Озёрный край',
    description:  'Радиальный маршрут от озера Западное до озера Кщара. Включает в себя посещение четырех озер этого края. Может также быть совмещен с маршрутом "На озеро Кщара" с завершением в городе Вязники.',
    distance:      39000,
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       User.all.sample.id,
    title:        'Боровский тракт',
    description:  'Маршрут соединяет центры ремесел и старинные усадьбы в окрестностях Богородска и Ворсмы с районом карстовых озер и сосновых лесов в долине реки Сережа.',
    distance:      15200,
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       User.all.sample.id,
    title:        'Тропы Березополья',
    description:  'Пешеходный маршрут по участку бывшего Боровского тракта и его окрестностям. Вы увидите, что осталось от старинной большой дороги, посетите Чайниково болото и красивое урочище Кузьминка.',
    distance:      27000,
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       User.all.sample.id,
    title:        'Старицкая Земля',
    description:  'Уникальная архитектура, история и природа на всем протяжении маршрута в районе города Старица: пещеры, водопад, усадебные и купеческие постройки 16-17 века, церкви и монастырь.',
    distance:      17800,
    difficulty_id: Difficulty.all.sample.id,
    season_id:     Season.all.sample.id,
    kind_id:       Kind.all.sample.id,
    collection_id: Collection.all.sample.id,
    cover:         upload_fake_route_cover
  }
]

def create_route(route)
  Route.create(
    user_id:       route[:user_id],
    title:         route[:title],
    description:   route[:description],
    distance:      route[:distance],
    difficulty_id: route[:difficulty_id],
    season_id:     route[:season_id],
    kind_id:       route[:kind_id],
    collection_id: route[:collection_id],
    cover:         route[:cover]
  )
end

@routes.each do |route|
  r = create_route(route)

  if r.save
    puts "Route #{r.title} created"
  else
    puts "Route #{r.title} not created"
  end
end

def random_route_id
  Route.offset(rand(Route.count)).first.id
  # routes_quantity = Route.count
  # routes_random_offset = rand(routes_quantity)
  # random_route = Route.offset(routes_random_offset).first
  # random_route_id = random_route.id
  # random_route.id
end


# Create spot status method
@statuses = [ 'активный', 'нужна проверка', 'неактивный' ]

# Create tag_list method
@tag_list = ['храм', 'здание', 'река', 'место для ночлега', 'кормушка для животных', 'панорамный вид', 'место для рыбалки', 'перекат', 'водопад', 'мост', 'плотина', 'заповедник', 'хвойный лес', 'заброшенное здание']


# Create spot method
@spots = [
  {
    name:        'Абабковский монастырь',
    status:       0,
    user_id:      User.all.sample.id,
    description: 'Не доходя до монастыря можно найти небольшую часовню с родником. Абабковский православный женский монастырь Выксунской епархии Русской православной церкви. В настоящее время монастырь восстанавливается к первоначальному образу, но уже сейчас можно увидеть внешний облик красивого храма.',
    tag_list:     3.times.map { @tag_list.sample },
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    # user_id:      User.all.sample.id,
    longitude:    56.07072,
    latitude:     43.10256
  }, {
    name:        'река Кишма',
    status:       1,
    user_id:      User.all.sample.id,
    description: 'Здесь туристам предстоит переход через реку по трубам. Ширина Кишмы здесь не более 15 метров и глубина от 1 до 1,5 метров.',
    tag_list:     2.times.map { @tag_list.sample },
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    # user_id:      User.all.sample.id,
    longitude:    56.09047,
    latitude:     43.05308
  }, {
    name:        'урочище Костино',
    status:       2,
    user_id:      User.all.sample.id,
    description: 'Отсюда открываются потрясающие виды на пойму Оки и бескрайний лес за рекой. А на месте поселения Костино, первое упоминание о котором датируется 15-ым веком, стоит крест и лежат каменные глыбы.',
    tag_list:     3.times.map { @tag_list.sample },
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    # user_id:      User.all.sample.id,
    longitude:    56.13747,
    latitude:     43.01523
  }, {
    name:        'река Ока',
    status:       0,
    user_id:      User.all.sample.id,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:     4.times.map { @tag_list.sample },
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    # user_id:      User.all.sample.id,
    longitude:    56.10654,
    latitude:     43.03003
  }, {
    name:        'г. Павлово',
    status:       0,
    user_id:      User.all.sample.id,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:     5.times.map { @tag_list.sample },
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    # user_id:      User.all.sample.id,
    longitude:    55.964629,
    latitude:     43.064570
  }, {
    name:        'г. Горбатов',
    status:       0,
    user_id:      User.all.sample.id,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:    @tag_list.sample,
    # route_id:     Route.all.sample.id,
    route_id:     random_route_id,
    # user_id:      User.all.sample.id,
    longitude:    56.130869,
    latitude:     43.062701
  }
]

@spots.each do |spot|
  s = Spot.create(spot)

  if s.save
    puts "Spot #{s.name} created"
  else
    puts "Spot #{s.name} not created"
  end
end

5.times do |n|
  @spots.each do |spot|
    # n начнётся с нуля, поэтому +1
    Spot.create(spot.merge(route_id: n+1))
  end
end



# Create comment method
@comments = [
  {
    body: 'йо',
    route_id: random_route_id,
    user_id: User.all.sample.id
  }, {
    body: 'рэп',
    route_id: random_route_id,
    user_id: User.all.sample.id
  }, {
    body: 'код',
    route_id: random_route_id,
    user_id: User.all.sample.id
  }
]

@comments.each do |comment|
  c = Comment.create(comment)

  if c.save
    puts "Comment created"
  else
    puts "Comment not created"
  end
end
