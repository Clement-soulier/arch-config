from ranger.api.commands import Command
import os

class open_archive(Command):
    """
    :open_archive

    Ouvre l'archive sélectionnée via AVFS (dans ~/.avfs).
    """
    def execute(self):
        filepath = self.fm.thisfile.path
        avfs_path = os.path.expanduser("~/.avfs" + filepath + "#")

        if os.path.exists(avfs_path):
            self.fm.cd(avfs_path)
        else:
            self.fm.notify("AVFS: Archive non montée ou chemin invalide", bad=True)

class extract_from_archive(Command):
    """
    :extract_from_archive
    Extrait un fichier ou tous les fichiers d'une archive vers le répertoire courant.
    """
    def execute(self):
        filepath = self.fm.thisfile.path
        avfs_path = os.path.expanduser("~/.avfs" + filepath + "#")
        
        if os.path.exists(avfs_path):
            os.system(f'atool -x {avfs_path} -d ./')
            self.fm.notify("Extraction réussie", bad=False)
        else:
            self.fm.notify("Erreur : archive non trouvée ou monté", bad=True)
