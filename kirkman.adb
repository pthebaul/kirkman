with Ada.Exceptions;  use Ada.Exceptions;
with Ada.Text_IO ;

package body Kirkman is

    function "="(G, D : in Personne) return Boolean is
    begin
        if not (G.Defini and D.Defini) then
            raise Personne_indefinie;
        else
            return G.Numero = D.Numero;
        end if;
    end "=";

    function "<"(G, D : in Personne) return Boolean is
    begin
        if not (G.Defini and D.Defini) then
            raise Personne_indefinie;
        else
            return G.Numero < D.Numero;
        end if;
    end "<";

    function "<="(G, D : in Personne) return Boolean is
    begin
        return (G < D) or (G = D);
    end "<=";

    function ">"(G, D : in Personne) return Boolean is
    begin
        return not (G <= D);
    end ">";

    function ">="(G, D : in Personne) return Boolean is
    begin
        return (G > D) or (G = D);
    end ">=";

    function PersonneImage(P : in Personne) return String is
    begin
        if not P.Defini then
            return " ??";
        elsif P.Numero < 10 then
            return " " & Integer'Image(P.Numero);
        else
            return Integer'Image(P.Numero);
        end if;
    end PersonneImage;
    
    package Txt renames Ada.Text_IO;

    procedure AfficherPersonne(P : in Personne) is
    begin
        Txt.Put(PersonneImage(P));
    end AfficherPersonne;

    procedure AfficherRang(R : in Rang) is
    begin
        Txt.Put("(");
        for Indice in R'Range loop
            Txt.Put(PersonneImage(R(Indice)));
            if Indice /= R'Last then
                Txt.Put(",");
            end if;
        end loop;
        Txt.Put(")");
    end AfficherRang;

    procedure AfficherJour(J : in Jour) is
    begin
        for Indice in J'Range loop
            Txt.Put("Rang" & Integer'Image(Indice) & " : ");
            AfficherRang(J(Indice));
            Txt.New_Line;
        end loop;
    end AfficherJour;

    procedure AfficherSemaine(S : in Semaine) is
    begin
        for Indice in S'Range loop
            Txt.Put_Line("Jour" & Integer'Image(Indice) & " :");
            AfficherJour(S(Indice));
            if Indice /= S'Last then
                Txt.New_Line;
            end if;
        end loop;
    end AfficherSemaine;

    procedure RetenirRencontre(P1, P2 : in Personne; CG : in out ConnaissancesGroupe) is
    begin
        if not (P1.Defini and P2.Defini) then
            raise Personne_indefinie;
        else
            EP.Inserer(P1, CG(P2.Numero));
            EP.Inserer(P2, CG(P1.Numero));
        end if;
    end RetenirRencontre;

    procedure RetenirRencontresRang(R : in Rang; CG : in out ConnaissancesGroupe) is
    begin
        for Indice1 in R'Range loop
            for Indice2 in Indice1+1..R'Last loop
                RetenirRencontre(R(Indice1), R(Indice2), CG);
            end loop;
        end loop;
    end RetenirRencontresRang;

    procedure RetenirRencontresJour(J : in Jour; CG : in out ConnaissancesGroupe) is
    begin
        for Indice in J'Range loop
            RetenirRencontresRang(J(Indice), CG);
        end loop;
    end RetenirRencontresJour;

    procedure AfficherCG(CG : in ConnaissancesGroupe) is
    begin
        for Indice in CG'Range loop
            Txt.Put("Le");
            if Indice < 10 then
                Txt.Put(" ");
            end if;
            Txt.Put_Line(Integer'Image(Indice) & " a vu :" & EP.ToString(CG(Indice)));
        end loop;
    end AfficherCG;

end Kirkman ;
