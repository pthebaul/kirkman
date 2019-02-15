with Ada.Text_IO, Ada.Unchecked_Deallocation ;

package body Kirkman is

    package Txt renames Ada.Text_IO ;
    procedure Liberer is new Ada.Unchecked_Deallocation (Cellule, Liste) ;
    
    function Est_Vide (L : in Liste) return Boolean is
    begin
        return L = null ;
    end Est_Vide ;

    procedure Init (L : in out Liste) is
    begin
        if not Est_Vide (L) then
            if Est_Vide (L.all.Suiv) then
                Liberer (L) ;
            else
                Init (L.all.Suiv) ;
            end if ;
        end if ;
    end Init ;

    function Appartient (E : in Personne ; L : in Liste) return Boolean is
        Resultat : Boolean ;
    begin
        if Est_Vide (L) then
            Resultat := False ;
        else
            if L.all.Info = E then
                Resultat := True ;
            else
                Resultat := Appartient (E, L.all.Suiv) ;
            end if ;
        end if ;

        return Resultat ;
    end Appartient ;

    procedure Inserer (E : in Personne ; L : in out Liste) is
        Nouveau : Liste ;
    begin
        if Est_Vide (L) then
            L := new Cellule'(E, null) ;
        elsif not Appartient (E, L) then
            if L.all.Info > E then
                Nouveau := new Cellule'(E, L) ;
                L := Nouveau ;
            else
                Inserer (E, L.all.Suiv) ;
            end if ;
        end if ;
    end Inserer ;

    procedure Supprimer (E : in Personne ; L : in out Liste) is
       Temporaire : Liste ;
    begin
        if Est_Vide (L) then
            raise Liste_Vide ;
        elsif L.all.Info = E then
            Temporaire := L ;
            L := L.all.Suiv ;
            Liberer (Temporaire) ;
        elsif not Est_Vide (L.all.Suiv) then
            Supprimer (E, L.all.Suiv) ;
        end if ;
    end Supprimer ;

    procedure Afficher (L : in Liste) is
    begin
        if Est_Vide (L) then
            Txt.Put_Line (" null") ;
        else
            Txt.Put (Integer'Image (L.all.Info) & " ->") ;
            Afficher (L.all.Suiv) ;
        end if ;
    end Afficher ;

end Kirkman ;
