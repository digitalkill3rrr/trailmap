Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def random_route_id
  Route.offset(rand(Route.count)).first.id
  # routes_quantity = Route.count
  # routes_random_offset = rand(routes_quantity)
  # random_route = Route.offset(routes_random_offset).first
  # random_route_id = random_route.id
  # random_route.id
end

Route.create([
  {
    title: 'Oкская тропа',
    description: 'description',
    difficulty_id: 1,
    season_id: 1,
    distance: '41 км',
    kind_id: 1
  }, {
    title: 'Озёрный край',
    description: 'description',
    difficulty_id: 2,
    season_id: 2,
    distance: '39 км',
    kind_id: 2
  }
])

Season.create([
  {
    title: 'лето'
  }, {
    title: 'осень'
  }, {
    title: 'зима'
  }, {
    title: 'весна'
  }
])

Difficulty.create([
  {
    level: 'лёгкая'
  }, {
    level: 'средняя'
  }, {
    level: 'сложная'
  }
])

Kind.create([
  {
    title: 'пеший'
  }, {
    title: 'вело'
  }
])

# spot_titles = ['Абабковский монастырь', 'река Кишма', 'урочище Костино', 'река Ока']

# spot_latitude = [43.10256, 43.05308, 43.01523, 43.03003]
# spot_longitude = [56.07072, 56.09047, 56.13747, 56.10654]

Spot.create([
  {
    name:        'Абабковский монастырь',
    description: 'Не доходя до монастыря можно найти небольшую часовню с родником. Абабковский православный женский монастырь Выксунской епархии Русской православной церкви. В настоящее время монастырь восстанавливается к первоначальному образу, но уже сейчас можно увидеть внешний облик красивого храма.',
    tag_list:    ['храм', 'здание'],
    route_id: random_route_id,
    latitude: 43.10256,
    longitude: 56.07072
  }, {
    name:        'река Кишма',
    description: 'Здесь туристам предстоит переход через реку по трубам. Ширина Кишмы здесь не более 15 метров и глубина от 1 до 1,5 метров.',
    tag_list:    'река',
    route_id: random_route_id,
    latitude: 43.05308,
    longitude: 56.09047
  }, {
    name:        'урочище Костино',
    description: 'Отсюда открываются потрясающие виды на пойму Оки и бескрайний лес за рекой. А на месте поселения Костино, первое упоминание о котором датируется 15-ым веком, стоит крест и лежат каменные глыбы.',
    tag_list:    ['заброшка', 'река', 'храм'],
    route_id: random_route_id,
    latitude: 43.01523,
    longitude: 56.13747
  }, {
    name:        'река Ока',
    description: 'Река Ока будет вас сопровождать практически на всем пути. Это красивая река которая именно в Нижегородской области впадает в величественную Волгу. В прошлом главная судоходная артерия, обеспечивающая г. Горбатов стабильным доходом от торговли, течет извилисто, создавая излучины и обрывистые берега.',
    tag_list:    ['река', 'здание'],
    route_id: random_route_id,
    latitude: 43.03003,
    longitude: 56.10654
  }
])
