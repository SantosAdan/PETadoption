module AnimalsHelper
    def belongs_to_user(animal)
        user_signed_in? && animal.usuario == current_user
    end
end