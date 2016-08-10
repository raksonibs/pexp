# # :mnesia.create_table(:user, [
# #   {:ram_copies, [node()]},
# #   {:attributes, [:name, :email, :first, :last]}
# # ])

# use Amnesia

# defdatabase Physics.Database do
#   deftable Planet, [{:id, autoincrement }, :name, :mass, :radius, :type, :ev], type: :ordered_set do

#   end

#   res = Amnesia.transaction! do
#     planets = [
#       %Planet{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6},
#       %Planet{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6},
#       %Planet{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6},
#       %Planet{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6},
#       %Planet{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7},
#       %Planet{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7},
#     %Planet{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7},
#       %Planet{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}
#     ]
#     for planet <- planets, do: planet |> Planet.write!
#   end
# end

use Amnesia

defdatabase Physics.Database do

  deftable Planet, [{:id, autoincrement }, :name, :mass, :radius, :type, :ev], type: :ordered_set do
    #helper methods, lookups, special queries etc can go in here
    #for instance:
    #def add_moon(self, moon) do
      # add to moons table
    #end
  end

end