
package ma.gestion.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "seances_zoom")
public class SeanceZoom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String lienZoom;

    private LocalDateTime dateHeure;

    private int duree;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cours_id", nullable = false)
    private Cours cours;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "enseignant_id", nullable = false)
    private Enseignant enseignant;

    public SeanceZoom() {
    }

    public SeanceZoom(String lienZoom,
                      LocalDateTime dateHeure,
                      int duree,
                      Cours cours,
                      Enseignant enseignant) {
        this.lienZoom = lienZoom;
        this.dateHeure = dateHeure;
        this.duree = duree;
        this.cours = cours;
        this.enseignant = enseignant;
    }

    // Retourner le lien de la séance.
    // L'ouverture réelle sera faite depuis l'interface web.

    public String lancer() {
        return lienZoom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLienZoom() {
        return lienZoom;
    }

    public void setLienZoom(String lienZoom) {
        this.lienZoom = lienZoom;
    }

    public LocalDateTime getDateHeure() {
        return dateHeure;
    }

    public void setDateHeure(LocalDateTime dateHeure) {
        this.dateHeure = dateHeure;
    }

    public int getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }

    public Cours getCours() {
        return cours;
    }

    public void setCours(Cours cours) {
        this.cours = cours;
    }

    public Enseignant getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(Enseignant enseignant) {
        this.enseignant = enseignant;
    }
}
