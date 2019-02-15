with Kirkman, Ada.Text_IO ;

procedure Arbre is

    package K renames Kirkman ;
    package Txt renames Ada.Text_IO ;

    procedure Deja_Vu_Rang (R : in K.Rang ; L : in out K.Listes) is
    begin
        for Indice_Principal in R'Range loop
            for Indice_Secondaire in R'Range loop
                if Indice_Principal /= Indice_Secondaire then
                    K.Inserer (R(Indice_Secondaire), L(R(Indice_Principal))) ;
                end if ;    
            end loop ;
        end loop ;
    end Deja_Vu_Rang ;

    procedure Deja_Vu_Jour (J : in K.Jour ; L : in out K.Listes) is
    begin
       for Indice_Rang in J'Range loop
           Deja_Vu_Rang (J(Indice_Rang), L) ;
       end loop ;
    end Deja_Vu_Jour ;

    Qui_A_Vu_Qui : K.Listes ;
    Experience : K.Semaine ;

begin

    Experience(1) := ((1, 2, 3), (4, 5, 6), (7, 8, 9), (10, 11, 12), (13, 14, 15)) ;
    Deja_Vu_Jour (Experience(1), Qui_A_Vu_Qui) ;

    for Indice_L in Qui_A_Vu_Qui'Range loop
        Txt.Put ("Personne" & Integer'Image (Indice_L) & " :") ;
        K.Afficher (Qui_A_Vu_Qui(Indice_L)) ;
    end loop ;

end Arbre ;
