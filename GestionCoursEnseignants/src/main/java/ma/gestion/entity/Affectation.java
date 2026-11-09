
package ma.gestion.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "affectations")
public class Affectation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private LocalDate dateAffectation;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "administrateur_id", nullable = false)
    private Administrateur administrateur;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "enseignant_id", nullable = false)
    private Enseignant enseignant;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cours_id", nullable = false)
    private Cours cours;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "annee_universitaire_id", nullable = false)
    private AnneeUniversitaire anneeUniversitaire;

    public Affectation() {
    }

    public Affectation(LocalDate dateAffectation,
                       Administrateur administrateur,
                       Enseignant enseignant,
                       Cours cours,
                       AnneeUniversitaire anneeUniversitaire) {
        this.dateAffectation = dateAffectation;
        this.administrateur = administrateur;
        this.enseignant = enseignant;
        this.cours = cours;
        this.anneeUniversitaire = anneeUniversitaire;
    }

    // Vérifier si deux affectations sont identiques
    // pour le même enseignant, cours et année.

    public boolean verifierDoublon(Affectation autre) {

        if (autre == null) {
            return false;
        }

        return this.enseignant != null
                && autre.enseignant != null
                && this.cours != null
                && autre.cours != null
                && this.anneeUniversitaire != null
                && autre.anneeUniversitaire != null
                && this.enseignant.getId() == autre.enseignant.getId()
                && this.cours.getId() == autre.cours.getId()
                && this.anneeUniversitaire.getId()
                == autre.anneeUniversitaire.getId();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getDateAffectation() {
        return dateAffectation;
    }

    public void setDateAffectation(LocalDate dateAffectation) {
        this.dateAffectation = dateAffectation;
    }

    public Administrateur getAdministrateur() {
        return administrateur;
    }

    public void setAdministrateur(Administrateur administrateur) {
        this.administrateur = administrateur;
    }

    public Enseignant getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(Enseignant enseignant) {
        this.enseignant = enseignant;
    }

    public Cours getCours() {
        return cours;
    }

    public void setCours(Cours cours) {
        this.cours = cours;
    }

    public AnneeUniversitaire getAnneeUniversitaire() {
        return anneeUniversitaire;
    }

    public void setAnneeUniversitaire(
            AnneeUniversitaire anneeUniversitaire) {
        this.anneeUniversitaire = anneeUniversitaire;
    }
}
