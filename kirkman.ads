package Kirkman is

    Taille_du_groupe : Positive := 15 ;
    Taille_de_rang : Positive := 3 ;
    Nombre_de_jours : Positive := 7 ;

    Nombre_de_rangs : Positive := Taille_du_groupe / Taille_de_rang ;

    subtype Personne is Positive range 1..Taille_du_groupe ;
    type Rang is array (Positive range 1..Taille_de_rang) of Personne ;
    type Jour is array (Positive range 1..Nombre_de_rangs) of Rang ;
    type Semaine is array (Positive range 1..Nombre_de_jours) of Jour ;

    type Liste is limited private ;
    type Listes is array (Positive range 1..Taille_du_groupe) of Liste ;

    function Est_Vide (L : in Liste) return Boolean ;

    procedure Init (L : in out Liste) ;

    function Appartient (E : in Personne ; L : in Liste) return Boolean ;

    procedure Inserer (E : in Personne ; L : in out Liste) ;

    procedure Supprimer (E : in Personne ; L : in out Liste) ;

    procedure Afficher (L : in Liste) ;

    Liste_Vide : exception ;

private

    type Cellule ;
    type Liste is access Cellule ;
    type Cellule is record
        Info : Personne ;
        Suiv : Liste ;
    end record ;

end Kirkman ;
