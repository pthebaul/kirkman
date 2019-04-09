with Ensembles, Ada.Text_IO;

procedure Test_Ensembles is

    package Txt renames Ada.Text_IO;
    
    function Inf (G, D : Integer) return Boolean is
    begin return G < D; end Inf;

    function Eq (G, D : Integer) return Boolean is
    begin return G = D; end Eq;

    package Ensembles_Entiers is new Ensembles (Integer, Inf, Eq, Integer'Image);
    package EE renames Ensembles_Entiers;

    E1, E2, E3 : EE.Ensemble;

begin

    EE.Init(E1);
    Txt.Put_Line("E1 :" & EE.ToString(E1));
    if EE.Est_Vide(E1) then
        Txt.Put_Line("E1 est vide");
    else
        Txt.Put_Line("E1 n'est pas vide");
    end if;

    EE.Inserer(1, E1);
    EE.Inserer(5, E1);
    EE.Inserer(3, E1);
    EE.Inserer(3, E1);
    EE.Inserer(8, E1);
    EE.Inserer(2, E1);
    EE.Inserer(7, E1);
    EE.Inserer(9, E1);
    Txt.Put_Line("E1 :" & EE.ToString(E1));

    if EE.Appartient(7, E1) then
        Txt.Put_Line("7 appartient à E1");
    else
        Txt.Put_Line("7 n'appartient pas à E1");
    end if;

    Txt.Put_Line(Integer'Image(EE.Premier(E1)) & " est le premier élément de E1");

    EE.Supprimer(3, E1);
    Txt.Put_Line("E1 :" & EE.ToString(E1));

    EE.Init(E2);
    Txt.Put_Line(Integer'Image(EE.Premier(E2)) & " est le premier élément de E2");

end Test_Ensembles;
