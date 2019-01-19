include("../Sources/chaine.jl")

using Test
using Random

# Tests Constructeurs
@testset "Constructeurs" begin
    # Max : Il y avait une paranthèse de trop à la ligne 9.
    @test systemeUnVoisin([1, 1, 1], 1.0) == Chaine([1, 1, 1], [0.0 1.0 0.0; 1.0 0.0 1.0; 0.0 1.0 0.0])

end

# Tests Énergie

@testset "Calculer Énergie" begin

    chaine = systemeUnVoisin([1, 1, 1, 0, 0], 3.0)
    @test calculer_energie(chaine) ≈ -6.0

   chaine = systemeDeuxVoisins([1, 1, 1], 1.0, 1.0)     # erreur #
   @test calculer_energie(chaine) ≈ -3.0

   chaine = systemeAleatoire([1, 1, 1], 1.0, 1.0)
   @test calculer_energie(chaine) ≈ -3.0

   chaine = systemeConstant([1, 0, 1], -2.0)
   @test calculer_energie(chaine) ≈ -2.0

   Random.seed!(42)
   chaine = systemeAleatoire([1, 1, 1], 3.0, 7.0)
   @test calculer_energie(chaine) ≈ -13.019595913383872
end
