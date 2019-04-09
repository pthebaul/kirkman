with Kirkman, Ensembles, Ada.Text_IO;

procedure Backtracking is

    package K is new Kirkman(15, 3, 7);
    package Txt renames Ada.Text_IO;

    function GenererRang(ConnaissancesGroupe : in out K.ConnaissancesGroupe; Personnes_Presentes : in out K.EP.Ensemble) return K.Rang is
        Resultat : K.Rang;
    begin
        return Resultat;
    end GenererRang;

    function GenererJour(ConnaissancesGroupe : in out K.ConnaissancesGroupe) return K.Jour is
        Resultat : K.Jour;
        Personnes_Presentes : K.EP.Ensemble;
    begin
        for Indice in Resultat'Range loop
            Resultat(Indice) := GenererRang(ConnaissancesGroupe, Personnes_Presentes);
        end loop;

        return Resultat;
    end GenererJour;

    function GenererSemaine return K.Semaine is
        Resultat : K.Semaine;
        ConnaissancesGroupe: K.ConnaissancesGroupe;
    begin
        for Indice in Resultat'Range loop
            Resultat(Indice) := GenererJour(ConnaissancesGroupe);
        end loop;
        
        return Resultat;
    end GenererSemaine;

    ConnaissancesGroupe: K.ConnaissancesGroupe;
    Experience : K.Semaine;

begin

    Txt.Put_Line ("-- Instanciation du premier jour");

    Experience(1) := (((1, True), (2, True), (3, True)), ((4, True), (5, True), (6, True)), ((7, True), (8, True), (9, True)), ((10, True), (11, True), (12, True)),
    ((13, True), (14, True), (15, True)));

    Txt.Put_Line ("-- Affichage du premier jour");

    K.AfficherJour(Experience(1));

    Txt.Put_Line ("-- Mémorisation des rencontres du premier jour");

    K.RetenirRencontresJour(Experience(1), ConnaissancesGroupe);

    Txt.Put_Line ("-- Affichage des connaissances des groupes");

    K.AfficherCG(ConnaissancesGroupe);

    Txt.Put_Line ("-- Fin du programme");

end Backtracking;
