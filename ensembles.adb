with Ada.Text_IO, Ada.Unchecked_Deallocation;

package body Ensembles is

    function ">" (G, D : Element) return Boolean is
    begin return not (G < D or G = D); end ">";

    package Txt renames Ada.Text_IO;
    procedure Liberer is new Ada.Unchecked_Deallocation(Cellule, Ensemble);
    
    -- Revoie vrai si l'ensemble est vide
    function Est_Vide (Ens : in Ensemble) return Boolean is
    begin
        return Ens = null;
    end Est_Vide;

    -- Désalloue la mémoire et fait de Ens un ensemble vide
    procedure Init (Ens : in out Ensemble) is
    begin
        if not Est_Vide(Ens) then
            if Est_Vide(Ens.all.Suiv) then
                Liberer(Ens);
            else
                Init(Ens.all.Suiv);
            end if;
        end if;
    end Init;

    -- Renvoie vrai si Elt appartient à Ens
    function Appartient (Elt : in Element; Ens : in Ensemble) return Boolean is
        Resultat : Boolean;
    begin
        if Est_Vide(Ens) then
            Resultat := False;
        elsif Ens.all.Info < Elt then
            Resultat := Appartient(Elt, Ens.all.Suiv);
        elsif Ens.all.Info = Elt then
            Resultat := True;
        else
            Resultat := False;
        end if;

        return Resultat;
    end Appartient;

    -- Insère Elt dans Ens s'il n'y est pas déjà
    procedure Inserer (Elt : in Element; Ens : in out Ensemble) is
    begin
        if Est_Vide(Ens) then
            Ens := new Cellule'(Elt, null);
        elsif Ens.all.Info < Elt then
            Inserer(Elt, Ens.all.Suiv);
        elsif Ens.all.Info > Elt then
            Ens := new Cellule'(Elt, Ens);
        end if;
    end Inserer;

    -- Supprime Elt dans Ens s'il y est
    --  peut lever l'exception Ensemble_Vide
    procedure Supprimer (Elt : in Element; Ens : in out Ensemble) is
       Temporaire : Ensemble;
    begin
        if Est_Vide(Ens) then
            raise Ensemble_Vide;
        elsif Ens.all.Info < Elt and not Est_Vide(Ens.all.Suiv) then
            Supprimer(Elt, Ens.all.Suiv);
        elsif Ens.all.Info = Elt then
            Temporaire := Ens;
            Ens := Ens.all.Suiv;
            Liberer(Temporaire);
        end if;
    end Supprimer;
    
    -- Renvoie une chaîne de caractères qui représente l'ensemble
    function ToString (Ens : in Ensemble) return String is
    begin
        if Est_Vide(Ens) then
            return " §§";
        else
            return ToString(Ens.all.Info) & " ->" & ToString(Ens.all.Suiv);
        end if;
    end ToString;

    -- Désalloue la mémoire de Cible et y effectue une copie de Source
    procedure Copier (Source : in Ensemble; Cible : out Ensemble) is
    begin
        Liberer(Cible);
        if not Est_Vide(Source) then
            Cible := new Cellule'(Source.all.Info, null);
            Copier(Source.all.Suiv, Cible.all.Suiv);
        end if;
    end Copier;

    -- Renvoie le premier élément de Ens
    --  peut lever l'exception Ensemble_Vide
    function Premier (Ens : in Ensemble) return Element is
    begin
        if Est_Vide(Ens) then
            raise Ensemble_Vide;
        else
            return Ens.all.Info;
        end if; 
    end Premier;

end Ensembles;
