with Ensembles;

generic

    Taille_du_groupe, Taille_de_rang, Nombre_de_jours : Positive;

package Kirkman is

    Nombre_de_rangs : Positive := Taille_du_groupe / Taille_de_rang;

    subtype Numero_Personne is Positive range 1..Taille_du_groupe;

    Personne_indefinie : exception;

    type Personne is record
        Numero : Numero_Personne;
        Defini : Boolean := False;
    end record;
    type Rang is array (Positive range 1..Taille_de_rang) of Personne;
    type Jour is array (Positive range 1..Nombre_de_rangs) of Rang;
    type Semaine is array (Positive range 1..Nombre_de_jours) of Jour;

    function "="(G, D : in Personne) return Boolean;
    function "<"(G, D : in Personne) return Boolean;
    --function ">"(G, D : in Personne) return Boolean;
    --function "<="(G, D : in Personne) return Boolean;
    --function ">="(G, D : in Personne) return Boolean;

    function PersonneImage(P : in Personne) return String;

    procedure AfficherPersonne(P : in Personne);
    procedure AfficherRang(R : in Rang);
    procedure AfficherJour(J : in Jour);
    procedure AfficherSemaine(S : in Semaine);

    package EP is new Ensembles(Personne, "=", "<", PersonneImage);

    type ConnaissancesGroupe is array (Numero_Personne) of EP.Ensemble;

    procedure RetenirRencontre(P1, P2 : in Personne; CG : in out ConnaissancesGroupe);
    procedure RetenirRencontresRang(R : in Rang; CG : in out ConnaissancesGroupe);
    procedure RetenirRencontresJour(J : in Jour; CG : in out ConnaissancesGroupe);

    procedure AfficherCG(CG : in ConnaissancesGroupe);

end Kirkman;
