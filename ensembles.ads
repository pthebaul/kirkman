generic

    type Element is private;
    with function "=" (G, D : in Element) return Boolean;
    with function "<" (G, D : in Element) return Boolean;
    with function ToString (Elt : in Element) return String;
    
package Ensembles is

    -- Définit une liste chaînée ordonnée de manière croissante
    --  dont un élement ne peux pas exister en deux exemplaires
    type Ensemble is limited private;

    -- Revoie vrai si l'ensemble est vide
    function Est_Vide (Ens : in Ensemble) return Boolean;

    -- Désalloue la mémoire et fait de Ens un ensemble vide
    procedure Init (Ens : in out Ensemble);

    -- Renvoie vrai si Elt appartient à Ens
    function Appartient (Elt : in Element; Ens : in Ensemble) return Boolean;

    -- Insère Elt dans Ens s'il n'y est pas déjà
    procedure Inserer (Elt : in Element; Ens : in out Ensemble);

    -- Supprime Elt dans Ens s'il y est
    --  peut lever l'exception Ensemble_Vide
    procedure Supprimer (Elt : in Element; Ens : in out Ensemble);

    -- Renvoie une chaîne de caractères qui représente l'ensemble
    function ToString (Ens : in Ensemble) return String;

    -- Désalloue la mémoire de Cible et y effectue une copie de Source
    procedure Copier (Source : in Ensemble; Cible : out Ensemble);
    
    -- Renvoie le premier élément de Ens
    --  peut lever l'exception Ensemble_Vide
    function Premier (Ens : in Ensemble) return Element;

    Ensemble_Vide : exception;

private

    type Cellule;
    type Ensemble is access Cellule;
    type Cellule is record
        Info : Element;
        Suiv : Ensemble;
    end record;

end Ensembles;
