% configure file for DTI tools
% BATCH system (Volkmar Glauche)
%
% File created by Susanne Schnell
%%
function dtijobs = dti_cfg

%_______________________________________________________________________
% dtijobs DTI tools
%_______________________________________________________________________
dtijobs         = cfg_choice;
dtijobs.tag     = 'dtijobs';
dtijobs.name    = 'DTI tools';
dtijobs.help    = {
                '%* Menu and Toolbar'
                '/*\subsection*{Menu and Toolbar}*/'
                'The "File" and "Edit" menu offer options to load, save and run a job and to modify the configuration of the batch system. For each application which is known to the batch system, a separate pulldown menu lists the available modules. Depending on the application, these modules may be grouped into submenus. Application specific defaults can be edited by choosing "Edit Defaults" from the application menu. The toolbar offers some shortcuts to frequently used operations (e.g. load, save, run).'
                'Jobs are saved as MATLAB .m files. These files contain a MATLAB script, which can be executed in MATLAB to recreate the job variable. Multiple jobs can be loaded at once. This allows to concatenate parts of a job.'
                ''
                '%* Top Left Panel'
                '/*\subsection*{Top Left Panel}*/'
                'The current job, which is represented as a list of executable modules. Modules marked with DEP depend on the successful execution of other modules in the job. Modules marked with X still require some values to be set before the job can be run, although an incompletely specified job can still be saved and loaded.'
                ''
                '%* Top Right Panel'
                '/*\subsection*{Top Right Panel}*/'
                'These are the configuration details for the currently selected module. Items marked with DEP depend on the successful execution of other modules in the job. Items marked with X still require some values to be set before the job can be run. Depending on the kind of detail currently selected, a choice of buttons appears below the Centre Right Panel to manipulate the current value.'
                ''
                '%* Centre Right Panel'
                '/*\subsection*{Centre Right Panel}*/'
                'This panel shows the current value of the highlighted item (where relevant).'
                ''
                '%* Edit Buttons'
                '/*\subsection*{Edit Buttons}*/'
                'Depending on the type of configuration item, different edit buttons appear.'
                '/*\begin{description}*/'
                '/*\item[Files]*/'
                '%* Files'
                '"Select Files" opens a file selection dialog box to select multiple files. "Edit Value" opens a generic value edit dialog to edit the list of files. "Dependencies" offers a list of outputs from other modules that can be used as an input to this item.'
                '/*\item[Generic Value]*/'
                '%* Generic Value'
                '"Edit Value" opens a generic value edit dialog to edit the list of files. "Dependencies" offers a list of outputs from other modules that can be used as an input to this item.'
                '%* Menu'
                '/*\item[Menu]*/'
                '"Edit Value" opens a selection dialog showing allowed menu options.'
                '%* Choice'
                '/*\item[Choice]*/'
                '"Edit Value" opens a selection dialog showing allowed menu options. Depending on the choosen option the module configuration may change.'
                '%* Repeat'
                '/*\item[Repeat]*/'
                '"Add Item", "Replicate Item", "Delete Item" allow to add new repeated items, to replicate or to delete items from the list. If more than one item or item type exists, a dialog popup will appear listing the available options. Multiple selections are allowed.'
                '/*\end{description}*/'
                ''
                '%* Bottom Panel'
                '/*\subsection*{Bottom Panel}*/'
                'This panel provides information about the meaning of the current item.'
                '/*\begin{figure} \begin{center} \includegraphics[width=70mm]{images/batch_ui1} \includegraphics[width=70mm]{images/batch_ui2} \includegraphics[width=70mm]{images/ui3} \includegraphics[width=70mm]{images/ui4}\end{center} \caption{The SPM5 user interface. \emph{Top left:} The usual user-interface.  \emph{Top right:} The Defaults user-interface. \emph{Bottom left:} The file selector (click the (?) button for more information about filtering filenames, or selecting individual volumes within a 4D file). \emph{Bottom right:} more online help can be obtained via the main help button.} \end{figure} */'
}';
dtijobs.values  = {dti_cfg_read dti_cfg_tensor dti_cfg_tracking dti_cfg_mapop dti_cfg_ftrop dti_cfg_roiop dti_cfg_fodop dti_cfg_logroi dti_cfg_realigndef};
