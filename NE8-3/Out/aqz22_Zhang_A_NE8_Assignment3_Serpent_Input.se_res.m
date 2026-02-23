
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
START_DATE                (idx, [1: 24])  = 'Mon Feb 23 18:34:31 2026' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Mon Feb 23 18:42:19 2026' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 1000 ;
SKIP                      (idx, 1)        = 100 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1771871671403 ;
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
OMP_HISTORY_PROFILE       (idx, [1:  16]) = [  1.20676E+00  9.80312E-01  9.91434E-01  9.87577E-01  9.80197E-01  9.87438E-01  9.64083E-01  9.96284E-01  9.85492E-01  9.83822E-01  9.90234E-01  9.93106E-01  9.81858E-01  9.82880E-01  9.89513E-01  9.99010E-01  ];
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

MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 1.1E-09  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:  2])  = [  9.00000E-01  9.00000E-01 ];
ST_FRAC                   (idx, [1:   4]) = [  4.96311E-03 0.00066  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.95037E-01 3.3E-06  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  8.83860E-01 2.2E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  8.84064E-01 2.2E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  2.46122E+00 0.00015  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  7.47172E+01 0.00026  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  7.47172E+01 0.00026  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  9.79831E+00 0.00029  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  2.71802E-01 0.00079  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 1000 ;
SIMULATED_HISTORIES       (idx, 1)        = 10003689 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00037E+04 0.00087 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00037E+04 0.00087 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  7.12350E+01 ;
RUNNING_TIME              (idx, 1)        =  7.80853E+00 ;
INIT_TIME                 (idx, [1:  2])  = [  3.32167E-02  3.32167E-02 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.18333E-03  1.18333E-03 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  7.77413E+00  7.77413E+00  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  7.80118E+00  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 9.12271 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.01439E+01 0.01076 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.44198E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 40155.61 ;
ALLOC_MEMSIZE             (idx, 1)        = 468.80;
MEMSIZE                   (idx, 1)        = 297.48;
XS_MEMSIZE                (idx, 1)        = 88.78;
MAT_MEMSIZE               (idx, 1)        = 15.56;
RES_MEMSIZE               (idx, 1)        = 85.97;
IFC_MEMSIZE               (idx, 1)        = 0.00;
MISC_MEMSIZE              (idx, 1)        = 107.17;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 171.32;

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
URES_AVAIL                (idx, 1)        = 3 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 9 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 9 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 222 ;
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

NORM_COEF                 (idx, [1:   4]) = [  3.60910E+09 0.00035  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  9.04714E-01 0.00097 ];
U235_FISS                 (idx, [1:   4]) = [  7.12439E+12 0.00066  9.35442E-01 0.00018 ];
U238_FISS                 (idx, [1:   4]) = [  4.91728E+11 0.00269  6.45580E-02 0.00258 ];
U235_CAPT                 (idx, [1:   4]) = [  1.29898E+12 0.00174  4.55761E-02 0.00171 ];
U238_CAPT                 (idx, [1:   4]) = [  7.61778E+12 0.00071  2.67276E-01 0.00062 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS    (idx, [1:  2])  = [ 10003689 1.00000E+07 ];
BALA_SRC_NEUTRON_NXN     (idx, [1:  2])  = [ 0 7.57944E+03 ];
BALA_SRC_NEUTRON_VR      (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT     (idx, [1:  2])  = [ 10003689 1.00076E+07 ];

BALA_LOSS_NEUTRON_CAPT    (idx, [1:  2])  = [ 7894127 7.89725E+06 ];
BALA_LOSS_NEUTRON_FISS    (idx, [1:  2])  = [ 2109562 2.11033E+06 ];
BALA_LOSS_NEUTRON_LEAK    (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_CUT     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_ERR     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT     (idx, [1:  2])  = [ 10003689 1.00076E+07 ];

BALA_NEUTRON_DIFF         (idx, [1:  2])  = [ 0 -8.19564E-08 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.46939E+02 6.7E-09 ];
TOT_POWDENS               (idx, [1:   2]) = [  3.80000E-02 4.3E-09 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.87216E+13 1.0E-05 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.60830E+12 1.1E-06 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  2.84919E+13 0.00024 ];
TOT_ABSRATE               (idx, [1:   2]) = [  3.61002E+13 0.00019 ];
TOT_SRCRATE               (idx, [1:   2]) = [  3.60910E+13 0.00035 ];
TOT_FLUX                  (idx, [1:   2]) = [  2.44066E+15 0.00027 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  3.61002E+13 0.00019 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  2.69853E+15 0.00028 ];
INI_FMASS                 (idx, 1)        =  6.49840E-03 ;
TOT_FMASS                 (idx, 1)        =  6.49840E-03 ;

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  1.29870E+00 0.00050 ];
SIX_FF_F                  (idx, [1:   2]) = [  4.06018E-01 0.00042 ];
SIX_FF_P                  (idx, [1:   2]) = [  8.85521E-01 0.00011 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.11216E+00 0.00024 ];
SIX_FF_LF                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_LT                 (idx, [1:   2]) = [  1.00000E+00 0.0E+00 ];
SIX_FF_KINF               (idx, [1:   2]) = [  5.19270E-01 0.00061 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  5.19270E-01 0.00061 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.46068E+00 1.1E-05 ];
FISSE                     (idx, [1:   2]) = [  2.02578E+02 1.1E-06 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  5.19225E-01 0.00061  5.15788E-01 0.00061  3.48222E-03 0.00824 ];
IMP_KEFF                  (idx, [1:   2]) = [  5.19018E-01 0.00019 ];
COL_KEFF                  (idx, [1:   2]) = [  5.18796E-01 0.00035 ];
ABS_KEFF                  (idx, [1:   2]) = [  5.19018E-01 0.00019 ];
ABS_KINF                  (idx, [1:   2]) = [  5.19018E-01 0.00019 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.83788E+01 0.00017 ];
IMP_ALF                   (idx, [1:   2]) = [  1.83749E+01 5.4E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  2.09565E-07 0.00313 ];
IMP_EALF                  (idx, [1:   2]) = [  2.09472E-07 0.00100 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  2.10108E-01 0.00291 ];
IMP_AFGE                  (idx, [1:   2]) = [  2.10741E-01 0.00100 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  1.38047E-02 0.00402  4.01946E-04 0.02131  2.18278E-03 0.00991  2.15190E-03 0.00999  6.31563E-03 0.00547  2.07126E-03 0.00976  6.81146E-04 0.01706 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  8.09948E-01 0.00877  1.09669E-02 0.01179  3.16508E-02 0.00015  1.10230E-01 0.00020  3.20719E-01 0.00015  1.34525E+00 0.00012  8.67198E+00 0.00530 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  6.78553E-03 0.00586  1.95470E-04 0.03397  1.07641E-03 0.01456  1.05729E-03 0.01500  3.11363E-03 0.00864  1.00531E-03 0.01590  3.37430E-04 0.02624 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  8.11316E-01 0.01382  1.24908E-02 1.9E-06  3.16413E-02 0.00025  1.10234E-01 0.00029  3.20740E-01 0.00023  1.34512E+00 0.00017  8.90450E+00 0.00149 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  1.91639E-04 0.00115  1.91545E-04 0.00115  2.07416E-04 0.01192 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  9.94672E-05 0.00098  9.94182E-05 0.00098  1.07648E-04 0.01189 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  6.70831E-03 0.00826  1.95291E-04 0.04724  1.07488E-03 0.02037  1.04962E-03 0.02069  3.05177E-03 0.01266  1.01105E-03 0.02149  3.25698E-04 0.03761 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  8.14134E-01 0.02069  1.24908E-02 3.9E-06  3.16472E-02 0.00039  1.10271E-01 0.00050  3.20656E-01 0.00037  1.34524E+00 0.00028  8.90172E+00 0.00244 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  1.91275E-04 0.00268  1.91160E-04 0.00270  1.73750E-04 0.02919 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  9.92738E-05 0.00260  9.92136E-05 0.00261  9.02107E-05 0.02915 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  6.55977E-03 0.02998  1.74703E-04 0.17368  1.16764E-03 0.07594  9.46695E-04 0.07994  2.92416E-03 0.04490  1.07559E-03 0.07626  2.70983E-04 0.13775 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  7.51483E-01 0.06531  1.24909E-02 1.2E-05  3.16043E-02 0.00101  1.10697E-01 0.00146  3.21083E-01 0.00106  1.34498E+00 0.00069  8.82099E+00 0.00590 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  6.53238E-03 0.02983  1.70134E-04 0.16702  1.19046E-03 0.07521  9.41377E-04 0.07799  2.90956E-03 0.04490  1.04713E-03 0.07507  2.73716E-04 0.13339 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  7.49810E-01 0.06474  1.24909E-02 1.2E-05  3.16050E-02 0.00101  1.10700E-01 0.00146  3.21062E-01 0.00106  1.34502E+00 0.00069  8.82099E+00 0.00590 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -3.44959E+01 0.03022 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  1.91914E-04 0.00078 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  9.96090E-05 0.00048 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  6.67850E-03 0.00574 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -3.48294E+01 0.00585 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  1.43008E-06 0.00018 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.38740E-06 0.00024  2.38752E-06 0.00025  2.36951E-06 0.00305 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  1.06735E-04 0.00033  1.06739E-04 0.00033  1.06174E-04 0.00398 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  8.85674E-01 0.00011  8.91570E-01 0.00013  4.72551E-01 0.00574 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.02887E+01 0.00886 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  7.47172E+01 0.00026  7.58020E+01 0.00057 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  7.94907E+04 0.00232  3.09148E+05 0.00091  6.09585E+05 0.00064  6.34308E+05 0.00054  5.46947E+05 0.00048  5.20154E+05 0.00045  3.56725E+05 0.00054  3.01156E+05 0.00046  2.32178E+05 0.00048  1.91075E+05 0.00049  1.65573E+05 0.00046  1.48917E+05 0.00051  1.38611E+05 0.00042  1.32403E+05 0.00053  1.29730E+05 0.00048  1.12467E+05 0.00060  1.12150E+05 0.00057  1.11449E+05 0.00050  1.10567E+05 0.00048  2.19041E+05 0.00033  2.16471E+05 0.00040  1.60488E+05 0.00050  1.06316E+05 0.00067  1.27504E+05 0.00048  1.25392E+05 0.00049  1.11766E+05 0.00055  2.00824E+05 0.00042  4.42682E+04 0.00086  5.54849E+04 0.00072  5.02081E+04 0.00081  2.94233E+04 0.00098  5.08505E+04 0.00093  3.46928E+04 0.00102  3.00438E+04 0.00114  5.82662E+03 0.00234  5.79948E+03 0.00202  5.94825E+03 0.00224  6.11890E+03 0.00240  6.04846E+03 0.00234  5.93770E+03 0.00208  6.14151E+03 0.00223  5.77086E+03 0.00180  1.08888E+04 0.00138  1.74079E+04 0.00154  2.21686E+04 0.00105  5.90142E+04 0.00074  6.42369E+04 0.00081  8.06957E+04 0.00074  6.90177E+04 0.00072  6.00166E+04 0.00068  4.99027E+04 0.00091  6.46993E+04 0.00070  1.37569E+05 0.00057  2.05689E+05 0.00041  4.33767E+05 0.00035  7.28883E+05 0.00039  1.16698E+06 0.00033  7.77137E+05 0.00035  5.68718E+05 0.00042  4.14217E+05 0.00042  3.76207E+05 0.00036  3.74200E+05 0.00038  3.14921E+05 0.00040  2.14625E+05 0.00043  1.99152E+05 0.00043  1.78618E+05 0.00048  1.52155E+05 0.00042  1.20701E+05 0.00043  8.16727E+04 0.00048  2.93235E+04 0.00065 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  5.18796E-01 0.00037 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  1.20228E+15 0.00037  1.23848E+15 0.00035 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  5.61409E-01 8.4E-05  1.63403E+00 4.4E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  2.87384E-03 0.00063  2.02174E-02 6.5E-05 ];
INF_ABS                   (idx, [1:   4]) = [  3.45762E-03 0.00055  2.57947E-02 0.00012 ];
INF_FISS                  (idx, [1:   4]) = [  5.83773E-04 0.00050  5.57730E-03 0.00037 ];
INF_NSF                   (idx, [1:   4]) = [  1.57422E-03 0.00053  1.35902E-02 0.00037 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.69663E+00 9.1E-05  2.43670E+00 0.0E+00 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.05608E+02 4.7E-06  2.02270E+02 0.0E+00 ];
INF_INVV                  (idx, [1:   4]) = [  6.62708E-08 0.00023  2.75409E-06 4.1E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  5.57949E-01 8.4E-05  1.60822E+00 4.6E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.99137E-01 0.00010  4.22290E-01 0.00010 ];
INF_SCATT2                (idx, [1:   4]) = [  1.16506E-01 0.00015  9.62608E-02 0.00034 ];
INF_SCATT3                (idx, [1:   4]) = [  6.82349E-03 0.00232  2.87336E-02 0.00087 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.50267E-02 0.00093 -1.06575E-02 0.00197 ];
INF_SCATT5                (idx, [1:   4]) = [ -1.01694E-03 0.01300  7.66832E-03 0.00226 ];
INF_SCATT6                (idx, [1:   4]) = [  5.74524E-03 0.00232 -1.94814E-02 0.00101 ];
INF_SCATT7                (idx, [1:   4]) = [  7.65801E-04 0.01678  9.57357E-04 0.02019 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  5.57972E-01 8.4E-05  1.60822E+00 4.6E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.99138E-01 0.00010  4.22290E-01 0.00010 ];
INF_SCATTP2               (idx, [1:   4]) = [  1.16506E-01 0.00015  9.62608E-02 0.00034 ];
INF_SCATTP3               (idx, [1:   4]) = [  6.82346E-03 0.00233  2.87336E-02 0.00087 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.50268E-02 0.00093 -1.06575E-02 0.00197 ];
INF_SCATTP5               (idx, [1:   4]) = [ -1.01698E-03 0.01301  7.66832E-03 0.00226 ];
INF_SCATTP6               (idx, [1:   4]) = [  5.74516E-03 0.00232 -1.94814E-02 0.00101 ];
INF_SCATTP7               (idx, [1:   4]) = [  7.65821E-04 0.01678  9.57357E-04 0.02019 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  1.73337E-01 0.00023  1.05920E+00 5.8E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.92304E+00 0.00023  3.14702E-01 5.8E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  3.43486E-03 0.00055  2.57947E-02 0.00012 ];
INF_REMXS                 (idx, [1:   4]) = [  3.04485E-02 0.00015  2.62003E-02 0.00026 ];

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

INF_S0                    (idx, [1:   8]) = [  5.30960E-01 8.2E-05  2.69892E-02 0.00018  3.94931E-04 0.00312  1.60783E+00 4.6E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.91049E-01 9.9E-05  8.08849E-03 0.00054  2.17647E-04 0.00418  4.22072E-01 0.00010 ];
INF_S2                    (idx, [1:   8]) = [  1.18782E-01 0.00015 -2.27566E-03 0.00156  1.16741E-04 0.00529  9.61440E-02 0.00034 ];
INF_S3                    (idx, [1:   8]) = [  9.61969E-03 0.00166 -2.79620E-03 0.00094  4.07502E-05 0.01204  2.86928E-02 0.00088 ];
INF_S4                    (idx, [1:   8]) = [ -1.40609E-02 0.00099 -9.65799E-04 0.00305 -2.92972E-07 1.00000 -1.06572E-02 0.00197 ];
INF_S5                    (idx, [1:   8]) = [ -1.02850E-03 0.01261  1.15559E-05 0.18405 -1.66322E-05 0.02429  7.68495E-03 0.00226 ];
INF_S6                    (idx, [1:   8]) = [  5.95897E-03 0.00217 -2.13730E-04 0.00930 -2.07065E-05 0.01624 -1.94607E-02 0.00101 ];
INF_S7                    (idx, [1:   8]) = [  1.02358E-03 0.01229 -2.57776E-04 0.00769 -1.87862E-05 0.01748  9.76143E-04 0.01969 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  5.30983E-01 8.3E-05  2.69892E-02 0.00018  3.94931E-04 0.00312  1.60783E+00 4.6E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.91049E-01 1.0E-04  8.08849E-03 0.00054  2.17647E-04 0.00418  4.22072E-01 0.00010 ];
INF_SP2                   (idx, [1:   8]) = [  1.18782E-01 0.00015 -2.27566E-03 0.00156  1.16741E-04 0.00529  9.61440E-02 0.00034 ];
INF_SP3                   (idx, [1:   8]) = [  9.61966E-03 0.00166 -2.79620E-03 0.00094  4.07502E-05 0.01204  2.86928E-02 0.00088 ];
INF_SP4                   (idx, [1:   8]) = [ -1.40610E-02 0.00099 -9.65799E-04 0.00305 -2.92972E-07 1.00000 -1.06572E-02 0.00197 ];
INF_SP5                   (idx, [1:   8]) = [ -1.02854E-03 0.01262  1.15559E-05 0.18405 -1.66322E-05 0.02429  7.68495E-03 0.00226 ];
INF_SP6                   (idx, [1:   8]) = [  5.95889E-03 0.00217 -2.13730E-04 0.00930 -2.07065E-05 0.01624 -1.94607E-02 0.00101 ];
INF_SP7                   (idx, [1:   8]) = [  1.02360E-03 0.01228 -2.57776E-04 0.00769 -1.87862E-05 0.01748  9.76143E-04 0.01969 ];

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

CMM_TRANSPXS              (idx, [1:   4]) = [  1.92692E-01 0.00042  1.00646E+00 0.00089 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  1.92384E-01 0.00071  1.01025E+00 0.00154 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  1.92502E-01 0.00070  1.01271E+00 0.00147 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  1.93203E-01 0.00074  9.96804E-01 0.00169 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.72989E+00 0.00042  3.31208E-01 0.00089 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.73269E+00 0.00071  3.29990E-01 0.00153 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.73163E+00 0.00070  3.29185E-01 0.00148 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.72534E+00 0.00074  3.34449E-01 0.00169 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  6.78553E-03 0.00586  1.95470E-04 0.03397  1.07641E-03 0.01456  1.05729E-03 0.01500  3.11363E-03 0.00864  1.00531E-03 0.01590  3.37430E-04 0.02624 ];
LAMBDA                    (idx, [1:  14]) = [  8.11316E-01 0.01382  1.24908E-02 1.9E-06  3.16413E-02 0.00025  1.10234E-01 0.00029  3.20740E-01 0.00023  1.34512E+00 0.00017  8.90450E+00 0.00149 ];

