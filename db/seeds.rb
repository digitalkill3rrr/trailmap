Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

# Create user
@users = [
  {
    email: 'admin@admin.com',
    nickname: 'true admin',
    role:  'admin'
  }, {
    email: 'content@content.com',
    nickname: 'makes content here',
    role:  'content'
  }, {
    email: 'user@user.com',
    nickname: 'user 1',
    role:  'user'
  }, {
    email: 'user2@user.com',
    nickname: 'user 2',
    role:  'user'
  }, {
    email: 'user3@user.com',
    nickname: 'user 3',
    role:  'user'
  }
]

def create_users(user)
  password = 'testtest'

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


# Route info
@seasons = [ 'лето', 'осень', 'зима', 'весна' ]
@difficulties = [ 'лёгкая', 'средняя', 'сложная' ]
@kinds = [ 'пеший', 'вело' ]

def random_season
  rand(0..3)
end

def random_difficulty
  rand(0..2)
end

def random_kind
  rand(0..1)
end

def random_distance
  rand(14000..60000)
end

# Create route_info method
@takeaways = [ 'Еда и питье', 'Подходящая одежда и обувь', 'Личное и групповое снаряжение', 'Аптечка' ]

@warnings = [
  'Затопление участков (весна)',
  'Нерасчищенные участки (зима)',
  'Крутые спуски и подъемы с натянутыми перилами',
  'Гадюки'
]


# Create collection
@collections = [
  {
    title:       'походы МО',
    description: 'походы по Московской Области',
    user_id:       2,
  }, {
    title:       'походы выходного дня',
    description: 'походы на выходных',
    user_id:       2,
  }
]

@collections.each do |collection|
  c = Collection.new(collection)

  if c.save
    puts "Collection #{c.title} created"
  else
    puts "Collection #{c.title} not created"
  end
end

def random_collection_id
  Collection.offset(rand(Collection.count)).first.id
end

# Fake route covers
def upload_fake_route_cover
  uploader = CoverUploader.new(Route.new, :cover)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/route/covers', '*')).uniq.sample))
  uploader
end


# Create route
@routes = [
  {
    user_id:       2,
    title:        'Oкская тропа',
    description:  'Маршрут вдоль реки Оки, в прошлом главного судоходного тракта через старинные города и села, от Павлова до города Горбатов. Это первый этап будущего большого маршрута от Павлова до Нижнего Новгорода общей протяженностью в 130 км.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'Озёрный край',
    description:  'Радиальный маршрут от озера Западное до озера Кщара. Включает в себя посещение четырех озер этого края. Может также быть совмещен с маршрутом "На озеро Кщара" с завершением в городе Вязники.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'Боровский тракт',
    description:  'Маршрут соединяет центры ремесел и старинные усадьбы в окрестностях Богородска и Ворсмы с районом карстовых озер и сосновых лесов в долине реки Сережа.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'Тропы Березополья',
    description:  'Пешеходный маршрут по участку бывшего Боровского тракта и его окрестностям. Вы увидите, что осталось от старинной большой дороги, посетите Чайниково болото и красивое урочище Кузьминка.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'Старицкая Земля',
    description:  'Уникальная архитектура, история и природа на всем протяжении маршрута в районе города Старица: пещеры, водопад, усадебные и купеческие постройки 16-17 века, церкви и монастырь.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'К Пантелееву болоту',
    description:  'Прогулка по Конаковскому району Тверской области. Маршрут пролегает по приятным лесным и полевым дорожкам и подходит к Пантелееву болоту, где по осени можно набрать клюквы.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'Менделеево',
    description:  'Маршрут возле Зеленограда по местам воинской славы войны 1941 г. Памятники в начале и в конце маршрута. От Штыков можно сделать радиальный выход к памятнику «Танк». От поселка ВНИИПП также можно сделать радиальный выход к рубежу 1941 г. На маршруте встречаются живописные заболоченные лесные озера.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'Марфино кольцо',
    description:  'Маршрут удачно сочетает прогулку по лесам и полям с осмотром исторических и культурных достопримечательностей: научного городка института кормов им. Вильямса, усадьбы Марфино, музея народных промыслов в Федоскино, музея истории танка Т-34.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }, {
    user_id:       2,
    title:        'Южный Вандан',
    description:  'Маршрут на вершину горы Южный Вандан высотой 713 метров. Вершина является частью горного хребта Вандан в Хабаровском крае.',
    distance:      random_distance,
    difficulty:    random_difficulty,
    season:        random_season,
    kind:          random_kind,
    collection_id: random_collection_id,
    cover:         upload_fake_route_cover
  }
]

def create_route(route)
  Route.create(
    user_id:       route[:user_id],
    title:         route[:title],
    description:   route[:description],
    distance:      route[:distance],
    difficulty:    route[:difficulty],
    season:        route[:season],
    kind:          route[:kind],
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
end


# Create spot status
@statuses = [ 'активный', 'нужна проверка', 'неактивный' ]

# Create tag_list
@tag_list = ['#храм', '#здание', '#река', '#место для ночлега', '#кормушка для животных', '#панорамный вид', '#место для рыбалки', '#перекат', '#водопад', '#мост', '#плотина', '#заповедник', '#хвойный лес', '#заброшенное здание']

# Create random users
def random_users
  rand(2..5)
end

# Fake route covers
def upload_fake_spot_image
  uploader = ImageUploader.new(SpotImage.new, :image)
  # uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/uploads/genre/covers', '*')).sample))
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/assets/spot/images', '*')).sample))
  uploader
end

# Create spot
@spots = [
  {
    name:        'Абабковский монастырь',
    status:       0,
    description: 'Не доходя до монастыря можно найти небольшую часовню с родником. Абабковский православный женский монастырь Выксунской епархии Русской православной церкви. В настоящее время монастырь восстанавливается к первоначальному образу, но уже сейчас можно увидеть внешний облик красивого храма.',
    tag_list:     [3.times.map { @tag_list.sample }],
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.07072,
    longitude:    43.10256,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'река Кишма',
    status:       1,
    description: 'Здесь туристам предстоит переход через реку по трубам. Ширина Кишмы здесь не более 15 метров и глубина от 1 до 1,5 метров.',
    tag_list:     2.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.09047,
    longitude:    43.05308,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'урочище Костино',
    status:       2,
    description: 'Отсюда открываются потрясающие виды на пойму Оки и бескрайний лес за рекой. А на месте поселения Костино, первое упоминание о котором датируется 15-ым веком, стоит крест и лежат каменные глыбы.',
    tag_list:     3.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.13747,
    longitude:    43.01523,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'река Ока',
    status:       0,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:     4.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     56.10654,
    longitude:    43.03003,
    spot_images_attributes: [ {image: upload_fake_spot_image}, {image: upload_fake_spot_image} ]
  }, {
    name:        'г. Павлово',
    status:       0,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:     5.times.map { @tag_list.sample },
    route_id:     random_route_id,
    user_id:      random_users,
    latitude:     55.964629,
    longitude:    43.064570,
    spot_images_attributes: [ {image: upload_fake_spot_image} ]
  }, {
    name:        'г. Горбатов',
    status:       0,
    user_id:      random_users,
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:    @tag_list.sample,
    route_id:     random_route_id,
    user_id:      User.all.sample.id,
    latitude:     56.130869,
    longitude:    43.062701,
    spot_images_attributes: [ {image: upload_fake_spot_image} ]
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



# Create comment
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
