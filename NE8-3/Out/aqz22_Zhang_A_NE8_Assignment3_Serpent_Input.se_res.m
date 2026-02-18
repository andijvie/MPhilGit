
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1: 14])  = 'Serpent 2.1.31' ;
COMPILE_DATE              (idx, [1: 20])  = 'Oct 23 2021 12:26:58' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1: 13])  = 'UO2 PIN MODEL' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1: 46])  = 'aqz22_Zhang_A_NE8_Assignment3_Serpent_Input.se' ;
WORKING_DIRECTORY         (idx, [1: 24])  = '/home/aqz22/serpent_test' ;
HOSTNAME                  (idx, [1: 17])  = 'ray.eng.cam.ac.uk' ;
CPU_TYPE                  (idx, [1: 41])  = 'Intel(R) Xeon(R) CPU E5-2650 v2 @ 2.60GHz' ;
CPU_MHZ                   (idx, 1)        = 1070.0 ;
START_DATE                (idx, [1: 24])  = 'Wed Feb 18 20:32:31 2026' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Wed Feb 18 20:38:25 2026' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 1000 ;
SKIP                      (idx, 1)        = 100 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1771446751075 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ];
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;

CRIT_SPEC_MODE            (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 4 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 1 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
DOUBLE_INDEXING           (idx, 1)        = 0 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 16 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
OMP_HISTORY_PROFILE       (idx, [1:  16]) = [  1.03592E+00  9.88805E-01  1.00151E+00  9.68210E-01  1.03289E+00  1.00193E+00  9.92244E-01  9.96866E-01  1.01954E+00  1.03540E+00  1.00509E+00  9.81737E-01  9.96853E-01  9.90300E-01  9.86050E-01  9.66658E-01  ];
SHARE_BUF_ARRAY           (idx, 1)        = 0 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;
OMP_SHARED_QUEUE_LIM      (idx, 1)        = 0 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1: 62])  = '/usr/software/mcnplib/SERPENT/XSdata_endfb7/sss_endfb7u.xsdata' ;
DECAY_DATA_FILE_PATH      (idx, [1:  3])  = 'N/A' ;
SFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;
BRA_DATA_FILE_PATH        (idx, [1:  3])  = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  6.33356E-03 0.00075  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.93666E-01 4.8E-06  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  8.90919E-01 2.8E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  8.91223E-01 2.7E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.48626E+00 0.00013  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  4.89376E+01 0.00023  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  4.89376E+01 0.00023  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  5.97292E+00 0.00027  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  1.95813E-01 0.00093  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 1000 ;
SIMULATED_HISTORIES       (idx, 1)        = 10001051 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00011E+04 0.00048 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00011E+04 0.00048 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  4.21795E+01 ;
RUNNING_TIME              (idx, 1)        =  5.90500E+00 ;
INIT_TIME                 (idx, [1:  2])  = [  3.10500E-02  3.10500E-02 ];
PROCESS_TIME              (idx, [1:  2])  = [  9.33333E-04  9.33333E-04 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  5.87302E+00  5.87297E+00  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  5.90413E+00  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 7.14302 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  7.35709E+00 0.00507 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  8.92554E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 40155.61 ;
ALLOC_MEMSIZE             (idx, 1)        = 386.44;
MEMSIZE                   (idx, 1)        = 223.65;
XS_MEMSIZE                (idx, 1)        = 95.40;
MAT_MEMSIZE               (idx, 1)        = 15.56;
RES_MEMSIZE               (idx, 1)        = 5.52;
IFC_MEMSIZE               (idx, 1)        = 0.00;
MISC_MEMSIZE              (idx, 1)        = 107.17;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 162.79;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 2 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 92368 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 4 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 10 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 10 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 269 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 1 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 1 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        =  0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  0.00000E+00 ;
INGESTION_TOXICITY        (idx, 1)        =  0.00000E+00 ;
ACTINIDE_INH_TOX          (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ING_TOX          (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
PHOTON_DECAY_SOURCE       (idx, 1)        =  0.00000E+00 ;
NEUTRON_DECAY_SOURCE      (idx, 1)        =  0.00000E+00 ;
ALPHA_DECAY_SOURCE        (idx, 1)        =  0.00000E+00 ;
ELECTRON_DECAY_SOURCE     (idx, 1)        =  0.00000E+00 ;

% Normalization coefficient:

NORM_COEF                 (idx, [1:   4]) = [  1.62360E+09 0.00032  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  2.47667E-01 0.00096 ];
U235_FISS                 (idx, [1:   4]) = [  7.40106E+12 0.00038  9.71729E-01 7.8E-05 ];
U238_FISS                 (idx, [1:   4]) = [  2.15335E+11 0.00271  2.82714E-02 0.00267 ];
U235_CAPT                 (idx, [1:   4]) = [  1.41813E+12 0.00104  1.64293E-01 0.00096 ];
U238_CAPT                 (idx, [1:   4]) = [  2.18407E+12 0.00092  2.53012E-01 0.00074 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS    (idx, [1:  2])  = [ 10001051 1.00000E+07 ];
BALA_SRC_NEUTRON_NXN     (idx, [1:  2])  = [ 0 7.68662E+03 ];
BALA_SRC_NEUTRON_VR      (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT     (idx, [1:  2])  = [ 10001051 1.00077E+07 ];

BALA_LOSS_NEUTRON_CAPT    (idx, [1:  2])  = [ 5312877 5.31647E+06 ];
BALA_LOSS_NEUTRON_FISS    (idx, [1:  2])  = [ 4688174 4.69121E+06 ];
BALA_LOSS_NEUTRON_LEAK    (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_CUT     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_ERR     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT     (idx, [1:  2])  = [ 10001051 1.00077E+07 ];

BALA_NEUTRON_DIFF         (idx, [1:  2])  = [ 0 -1.49012E-07 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.46929E+02 7.2E-09 ];
TOT_POWDENS               (idx, [1:   2]) = [  3.80000E-02 4.3E-09 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.86398E+13 4.9E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.61450E+12 5.3E-07 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  8.63130E+12 0.00024 ];
TOT_ABSRATE               (idx, [1:   2]) = [  1.62458E+13 0.00013 ];
TOT_SRCRATE               (idx, [1:   2]) = [  1.62360E+13 0.00032 ];
TOT_FLUX                  (idx, [1:   2]) = [  8.37468E+14 0.00027 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.62458E+13 0.00013 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  7.95118E+14 0.00027 ];
INI_FMASS                 (idx, 1)        =  6.49813E-03 ;
TOT_FMASS                 (idx, 1)        =  6.49813E-03 ;

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  1.85662E+00 0.00024 ];
SIX_FF_F                  (idx, [1:   2]) = [  6.57490E-01 0.00025 ];
SIX_FF_P                  (idx, [1:   2]) = [  8.55223E-01 0.00013 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.10004E+00 0.00015 ];
SIX_FF_LF                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_LT                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_KINF               (idx, [1:   2]) = [  1.14840E+00 0.00033 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  1.14840E+00 0.00033 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.44794E+00 5.4E-06 ];
FISSE                     (idx, [1:   2]) = [  2.02404E+02 5.3E-07 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.14842E+00 0.00034  1.14070E+00 0.00033  7.69209E-03 0.00567 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.14826E+00 0.00013 ];
COL_KEFF                  (idx, [1:   2]) = [  1.14817E+00 0.00032 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.14826E+00 0.00013 ];
ABS_KINF                  (idx, [1:   2]) = [  1.14826E+00 0.00013 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.86739E+01 8.7E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.86746E+01 3.3E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  1.55460E-07 0.00163 ];
IMP_EALF                  (idx, [1:   2]) = [  1.55188E-07 0.00062 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  9.95200E-02 0.00294 ];
IMP_AFGE                  (idx, [1:   2]) = [  9.92890E-02 0.00104 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  5.90988E-03 0.00385  1.75628E-04 0.02169  9.46032E-04 0.00942  9.41737E-04 0.00986  2.72381E-03 0.00554  8.38679E-04 0.01024  2.83990E-04 0.01759 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  7.83122E-01 0.00914  1.08544E-02 0.01228  3.17461E-02 0.00011  1.09759E-01 0.00014  3.18785E-01 0.00012  1.34962E+00 9.5E-05  8.43641E+00 0.00636 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  6.72268E-03 0.00533  2.02951E-04 0.03090  1.06852E-03 0.01320  1.07514E-03 0.01378  3.09194E-03 0.00786  9.57881E-04 0.01452  3.26257E-04 0.02508 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.89941E-01 0.01334  1.24906E-02 1.3E-06  3.17487E-02 0.00015  1.09760E-01 0.00020  3.18722E-01 0.00016  1.34962E+00 0.00013  8.76570E+00 0.00110 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  4.80862E-05 0.00069  4.80716E-05 0.00069  5.01820E-05 0.00711 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  5.52171E-05 0.00060  5.52004E-05 0.00061  5.76260E-05 0.00710 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  6.69749E-03 0.00576  2.01561E-04 0.03159  1.05941E-03 0.01436  1.06682E-03 0.01446  3.09417E-03 0.00824  9.56727E-04 0.01529  3.18805E-04 0.02641 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  7.83560E-01 0.01396  1.24906E-02 1.5E-06  3.17502E-02 0.00017  1.09785E-01 0.00024  3.18757E-01 0.00017  1.34949E+00 0.00015  8.75151E+00 0.00124 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  4.80585E-05 0.00149  4.80397E-05 0.00150  5.12249E-05 0.01984 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  5.51864E-05 0.00147  5.51647E-05 0.00148  5.88208E-05 0.01977 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  6.47183E-03 0.01635  1.82650E-04 0.09464  1.05724E-03 0.04396  1.04220E-03 0.04058  2.89531E-03 0.02552  9.74865E-04 0.04512  3.19558E-04 0.07836 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  7.83425E-01 0.04030  1.24906E-02 3.1E-06  3.17470E-02 0.00040  1.09832E-01 0.00054  3.18801E-01 0.00050  1.35005E+00 0.00030  8.77744E+00 0.00296 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  6.46569E-03 0.01605  1.91171E-04 0.09335  1.04978E-03 0.04272  1.05257E-03 0.03950  2.86346E-03 0.02514  9.83877E-04 0.04318  3.24832E-04 0.07609 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  7.89347E-01 0.03969  1.24906E-02 3.1E-06  3.17479E-02 0.00040  1.09836E-01 0.00054  3.18846E-01 0.00050  1.35002E+00 0.00030  8.77694E+00 0.00295 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -1.34896E+02 0.01634 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  4.80863E-05 0.00044 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  5.52169E-05 0.00026 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  6.63629E-03 0.00324 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.38036E+02 0.00327 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  9.97419E-07 0.00023 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.35467E-06 0.00026  2.35464E-06 0.00026  2.35961E-06 0.00300 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  5.76640E-05 0.00033  5.76659E-05 0.00034  5.74243E-05 0.00399 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  8.55490E-01 0.00013  8.54642E-01 0.00014  1.01318E+00 0.00567 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.03514E+01 0.00916 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  4.89376E+01 0.00023  5.11406E+01 0.00032 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  8.00675E+04 0.00231  3.09729E+05 0.00102  6.10249E+05 0.00068  6.34494E+05 0.00057  5.46195E+05 0.00041  5.19836E+05 0.00043  3.56228E+05 0.00040  3.00703E+05 0.00049  2.31677E+05 0.00052  1.90408E+05 0.00050  1.65192E+05 0.00040  1.48480E+05 0.00059  1.38211E+05 0.00047  1.32033E+05 0.00059  1.29316E+05 0.00049  1.12143E+05 0.00056  1.11724E+05 0.00054  1.10994E+05 0.00055  1.09881E+05 0.00057  2.17358E+05 0.00037  2.14322E+05 0.00038  1.58204E+05 0.00051  1.04328E+05 0.00061  1.24659E+05 0.00048  1.22183E+05 0.00059  1.08425E+05 0.00050  1.94567E+05 0.00048  4.28313E+04 0.00090  5.37416E+04 0.00082  4.86667E+04 0.00089  2.84501E+04 0.00108  4.93969E+04 0.00099  3.35761E+04 0.00109  2.89907E+04 0.00094  5.59199E+03 0.00223  5.57274E+03 0.00223  5.65555E+03 0.00209  5.85633E+03 0.00176  5.79853E+03 0.00200  5.67233E+03 0.00214  5.90089E+03 0.00248  5.52397E+03 0.00227  1.04481E+04 0.00170  1.66885E+04 0.00143  2.12957E+04 0.00118  5.64838E+04 0.00077  6.05588E+04 0.00069  7.01527E+04 0.00065  5.30444E+04 0.00078  4.26523E+04 0.00068  3.41846E+04 0.00078  4.22714E+04 0.00089  8.52846E+04 0.00060  1.21774E+05 0.00051  2.45887E+05 0.00051  3.97233E+05 0.00043  6.16935E+05 0.00037  4.02954E+05 0.00038  2.91899E+05 0.00038  2.11257E+05 0.00041  1.90846E+05 0.00046  1.88724E+05 0.00050  1.58169E+05 0.00048  1.07368E+05 0.00038  9.93849E+04 0.00056  8.87551E+04 0.00053  7.52804E+04 0.00058  5.95215E+04 0.00059  4.01635E+04 0.00055  1.43741E+04 0.00077 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  1.14817E+00 0.00030 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.37230E+14 0.00033  3.00258E+14 0.00027 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  5.60235E-01 8.7E-05  1.64583E+00 5.8E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  3.17123E-03 0.00061  2.30738E-02 6.9E-05 ];
INF_ABS                   (idx, [1:   4]) = [  4.39918E-03 0.00051  4.62391E-02 0.00017 ];
INF_FISS                  (idx, [1:   4]) = [  1.22795E-03 0.00057  2.31653E-02 0.00029 ];
INF_NSF                   (idx, [1:   4]) = [  3.15142E-03 0.00056  5.64469E-02 0.00029 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.56641E+00 5.2E-05  2.43670E+00 3.3E-09 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03822E+02 4.5E-06  2.02270E+02 2.7E-09 ];
INF_INVV                  (idx, [1:   4]) = [  6.46354E-08 0.00025  2.66643E-06 6.0E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  5.55837E-01 8.8E-05  1.59959E+00 6.1E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.98021E-01 0.00011  4.29898E-01 0.00014 ];
INF_SCATT2                (idx, [1:   4]) = [  1.16086E-01 0.00020  1.00136E-01 0.00046 ];
INF_SCATT3                (idx, [1:   4]) = [  6.72787E-03 0.00288  2.99921E-02 0.00138 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.49940E-02 0.00109 -1.01402E-02 0.00345 ];
INF_SCATT5                (idx, [1:   4]) = [ -9.94665E-04 0.01428  7.45563E-03 0.00378 ];
INF_SCATT6                (idx, [1:   4]) = [  5.75920E-03 0.00216 -1.90530E-02 0.00138 ];
INF_SCATT7                (idx, [1:   4]) = [  7.77593E-04 0.01654  6.75121E-04 0.04008 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  5.55860E-01 8.8E-05  1.59959E+00 6.1E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.98021E-01 0.00011  4.29898E-01 0.00014 ];
INF_SCATTP2               (idx, [1:   4]) = [  1.16086E-01 0.00020  1.00136E-01 0.00046 ];
INF_SCATTP3               (idx, [1:   4]) = [  6.72794E-03 0.00287  2.99921E-02 0.00138 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.49939E-02 0.00109 -1.01402E-02 0.00345 ];
INF_SCATTP5               (idx, [1:   4]) = [ -9.94477E-04 0.01429  7.45563E-03 0.00378 ];
INF_SCATTP6               (idx, [1:   4]) = [  5.75920E-03 0.00216 -1.90530E-02 0.00138 ];
INF_SCATTP7               (idx, [1:   4]) = [  7.77453E-04 0.01654  6.75121E-04 0.04008 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  1.72771E-01 0.00021  1.05397E+00 9.3E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.92934E+00 0.00021  3.16266E-01 9.3E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  4.37595E-03 0.00052  4.62391E-02 0.00017 ];
INF_REMXS                 (idx, [1:   4]) = [  3.06434E-02 0.00013  4.69579E-02 0.00029 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  5.29592E-01 8.6E-05  2.62448E-02 0.00017  7.12839E-04 0.00288  1.59887E+00 6.1E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.90170E-01 0.00011  7.85020E-03 0.00055  3.75668E-04 0.00371  4.29522E-01 0.00014 ];
INF_S2                    (idx, [1:   8]) = [  1.18318E-01 0.00020 -2.23172E-03 0.00117  2.05586E-04 0.00478  9.99305E-02 0.00046 ];
INF_S3                    (idx, [1:   8]) = [  9.44903E-03 0.00205 -2.72116E-03 0.00112  7.49728E-05 0.01057  2.99171E-02 0.00138 ];
INF_S4                    (idx, [1:   8]) = [ -1.40637E-02 0.00114 -9.30373E-04 0.00205  2.59218E-06 0.29455 -1.01428E-02 0.00346 ];
INF_S5                    (idx, [1:   8]) = [ -1.00859E-03 0.01362  1.39277E-05 0.19667 -2.74232E-05 0.02198  7.48306E-03 0.00377 ];
INF_S6                    (idx, [1:   8]) = [  5.96815E-03 0.00206 -2.08950E-04 0.01112 -3.58172E-05 0.01487 -1.90172E-02 0.00138 ];
INF_S7                    (idx, [1:   8]) = [  1.02684E-03 0.01241 -2.49243E-04 0.00810 -3.18654E-05 0.01479  7.06986E-04 0.03825 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  5.29615E-01 8.6E-05  2.62448E-02 0.00017  7.12839E-04 0.00288  1.59887E+00 6.1E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.90171E-01 0.00011  7.85020E-03 0.00055  3.75668E-04 0.00371  4.29522E-01 0.00014 ];
INF_SP2                   (idx, [1:   8]) = [  1.18318E-01 0.00020 -2.23172E-03 0.00117  2.05586E-04 0.00478  9.99305E-02 0.00046 ];
INF_SP3                   (idx, [1:   8]) = [  9.44910E-03 0.00205 -2.72116E-03 0.00112  7.49728E-05 0.01057  2.99171E-02 0.00138 ];
INF_SP4                   (idx, [1:   8]) = [ -1.40635E-02 0.00114 -9.30373E-04 0.00205  2.59218E-06 0.29455 -1.01428E-02 0.00346 ];
INF_SP5                   (idx, [1:   8]) = [ -1.00840E-03 0.01363  1.39277E-05 0.19667 -2.74232E-05 0.02198  7.48306E-03 0.00377 ];
INF_SP6                   (idx, [1:   8]) = [  5.96815E-03 0.00205 -2.08950E-04 0.01112 -3.58172E-05 0.01487 -1.90172E-02 0.00138 ];
INF_SP7                   (idx, [1:   8]) = [  1.02670E-03 0.01241 -2.49243E-04 0.00810 -3.18654E-05 0.01479  7.06986E-04 0.03825 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  1.92189E-01 0.00045  9.90414E-01 0.00119 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  1.91800E-01 0.00067  9.90484E-01 0.00210 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  1.92090E-01 0.00066  9.88097E-01 0.00205 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  1.92686E-01 0.00069  9.93161E-01 0.00238 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.73442E+00 0.00045  3.36583E-01 0.00119 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.73796E+00 0.00067  3.36608E-01 0.00210 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.73533E+00 0.00066  3.37418E-01 0.00206 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.72997E+00 0.00069  3.35722E-01 0.00238 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  6.72268E-03 0.00533  2.02951E-04 0.03090  1.06852E-03 0.01320  1.07514E-03 0.01378  3.09194E-03 0.00786  9.57881E-04 0.01452  3.26257E-04 0.02508 ];
LAMBDA                    (idx, [1:  14]) = [  7.89941E-01 0.01334  1.24906E-02 1.3E-06  3.17487E-02 0.00015  1.09760E-01 0.00020  3.18722E-01 0.00016  1.34962E+00 0.00013  8.76570E+00 0.00110 ];

