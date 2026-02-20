
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
START_DATE                (idx, [1: 24])  = 'Fri Feb 20 17:46:09 2026' ;
COMPLETE_DATE             (idx, [1: 24])  = 'Fri Feb 20 17:49:42 2026' ;

% Run parameters:

POP                       (idx, 1)        = 10000 ;
CYCLES                    (idx, 1)        = 1000 ;
SKIP                      (idx, 1)        = 100 ;
BATCH_INTERVAL            (idx, 1)        = 1 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1771609569286 ;
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
OMP_HISTORY_PROFILE       (idx, [1:  16]) = [  1.00237E+00  9.98981E-01  1.00042E+00  1.00411E+00  1.00194E+00  9.94908E-01  1.00437E+00  9.99593E-01  9.94788E-01  1.00077E+00  1.00678E+00  1.00198E+00  1.00026E+00  1.00476E+00  9.94508E-01  9.89470E-01  ];
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
ST_FRAC                   (idx, [1:   4]) = [  4.24960E-03 0.00077  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.95750E-01 3.3E-06  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  8.90913E-01 2.7E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  8.91217E-01 2.7E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  3.36808E+00 0.00021  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  4.71822E+01 0.00024  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  4.71308E+01 0.00024  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  5.75276E+00 0.00029  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  3.97403E+01 0.00018  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 1000 ;
SIMULATED_HISTORIES       (idx, 1)        = 10001492 ;
MEAN_POP_SIZE             (idx, [1:  2])  = [  1.00015E+04 0.00051 ];
MEAN_POP_WGT              (idx, [1:  2])  = [  1.00015E+04 0.00051 ];
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  5.25200E+01 ;
RUNNING_TIME              (idx, 1)        =  3.55977E+00 ;
INIT_TIME                 (idx, [1:  2])  = [  3.62833E-02  3.62833E-02 ];
PROCESS_TIME              (idx, [1:  2])  = [  1.28333E-03  1.28333E-03 ];
TRANSPORT_CYCLE_TIME      (idx, [1:  3])  = [  3.52220E+00  3.52220E+00  0.00000E+00 ];
MPI_OVERHEAD_TIME         (idx, [1:  2])  = [  0.00000E+00  0.00000E+00 ];
ESTIMATED_RUNNING_TIME    (idx, [1:  2])  = [  3.55280E+00  0.00000E+00 ];
CPU_USAGE                 (idx, 1)        = 14.75377 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  1.52944E+01 0.00285 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.11497E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 40155.61 ;
ALLOC_MEMSIZE             (idx, 1)        = 475.37;
MEMSIZE                   (idx, 1)        = 303.97;
XS_MEMSIZE                (idx, 1)        = 95.40;
MAT_MEMSIZE               (idx, 1)        = 15.56;
RES_MEMSIZE               (idx, 1)        = 85.83;
IFC_MEMSIZE               (idx, 1)        = 0.00;
MISC_MEMSIZE              (idx, 1)        = 107.17;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00;
UNUSED_MEMSIZE            (idx, 1)        = 171.40;

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

NORM_COEF                 (idx, [1:   4]) = [  1.68679E+09 0.00034  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  2.47389E-01 0.00100 ];
U235_FISS                 (idx, [1:   4]) = [  7.39820E+12 0.00038  9.71309E-01 8.0E-05 ];
U238_FISS                 (idx, [1:   4]) = [  2.18551E+11 0.00275  2.86913E-02 0.00270 ];
U235_CAPT                 (idx, [1:   4]) = [  1.41763E+12 0.00110  1.68828E-01 0.00103 ];
U238_CAPT                 (idx, [1:   4]) = [  2.18073E+12 0.00093  2.59685E-01 0.00075 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_FISS    (idx, [1:  2])  = [ 10001492 1.00000E+07 ];
BALA_SRC_NEUTRON_NXN     (idx, [1:  2])  = [ 0 7.42673E+03 ];
BALA_SRC_NEUTRON_VR      (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_SRC_NEUTRON_TOT     (idx, [1:  2])  = [ 10001492 1.00074E+07 ];

BALA_LOSS_NEUTRON_CAPT    (idx, [1:  2])  = [ 4975223 4.97829E+06 ];
BALA_LOSS_NEUTRON_FISS    (idx, [1:  2])  = [ 4513083 4.51576E+06 ];
BALA_LOSS_NEUTRON_LEAK    (idx, [1:  2])  = [ 513186 5.13381E+05 ];
BALA_LOSS_NEUTRON_CUT     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_ERR     (idx, [1:  2])  = [ 0 0.00000E+00 ];
BALA_LOSS_NEUTRON_TOT     (idx, [1:  2])  = [ 10001492 1.00074E+07 ];

BALA_NEUTRON_DIFF         (idx, [1:  2])  = [ 0 -1.21072E-07 ];

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  2.46929E+02 7.3E-09 ];
TOT_POWDENS               (idx, [1:   2]) = [  3.80000E-02 4.3E-09 ];
TOT_GENRATE               (idx, [1:   2]) = [  1.86407E+13 4.7E-06 ];
TOT_FISSRATE              (idx, [1:   2]) = [  7.61443E+12 5.3E-07 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  8.39671E+12 0.00024 ];
TOT_ABSRATE               (idx, [1:   2]) = [  1.60111E+13 0.00013 ];
TOT_SRCRATE               (idx, [1:   2]) = [  1.68679E+13 0.00034 ];
TOT_FLUX                  (idx, [1:   2]) = [  8.40235E+14 0.00027 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  8.66060E+11 0.00168 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  1.68772E+13 0.00015 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  7.95537E+14 0.00027 ];
INI_FMASS                 (idx, 1)        =  6.49813E-03 ;
TOT_FMASS                 (idx, 1)        =  6.49813E-03 ;

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  1.85704E+00 0.00025 ];
SIX_FF_F                  (idx, [1:   2]) = [  6.68061E-01 0.00025 ];
SIX_FF_P                  (idx, [1:   2]) = [  8.53932E-01 0.00014 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.10001E+00 0.00015 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.56791E-01 7.8E-05 ];
SIX_FF_LT                 (idx, [1:   2]) = [  9.91504E-01 3.1E-05 ];
SIX_FF_KINF               (idx, [1:   2]) = [  1.16532E+00 0.00035 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  1.10549E+00 0.00035 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.44808E+00 5.1E-06 ];
FISSE                     (idx, [1:   2]) = [  2.02406E+02 5.3E-07 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  1.10554E+00 0.00036  1.09795E+00 0.00036  7.53751E-03 0.00568 ];
IMP_KEFF                  (idx, [1:   2]) = [  1.10534E+00 0.00015 ];
COL_KEFF                  (idx, [1:   2]) = [  1.10523E+00 0.00033 ];
ABS_KEFF                  (idx, [1:   2]) = [  1.10534E+00 0.00015 ];
ABS_KINF                  (idx, [1:   2]) = [  1.16516E+00 0.00013 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.86693E+01 8.9E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.86681E+01 3.3E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  1.56196E-07 0.00168 ];
IMP_EALF                  (idx, [1:   2]) = [  1.56196E-07 0.00061 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.00573E-01 0.00290 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.00565E-01 0.00098 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  6.14411E-03 0.00395  1.89484E-04 0.02141  1.00286E-03 0.00954  9.66130E-04 0.00977  2.83003E-03 0.00567  8.64016E-04 0.01042  2.91590E-04 0.01748 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  7.74178E-01 0.00884  1.10168E-02 0.01157  3.17433E-02 0.00011  1.09785E-01 0.00016  3.18768E-01 0.00012  1.34980E+00 9.6E-05  8.42999E+00 0.00627 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  6.85775E-03 0.00542  2.18002E-04 0.02990  1.12758E-03 0.01341  1.06068E-03 0.01352  3.15696E-03 0.00793  9.68790E-04 0.01511  3.25738E-04 0.02497 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  7.73294E-01 0.01259  1.24907E-02 1.5E-06  3.17409E-02 0.00016  1.09786E-01 0.00022  3.18767E-01 0.00016  1.34989E+00 0.00012  8.75536E+00 0.00109 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  5.03430E-05 0.00071  5.03319E-05 0.00072  5.21625E-05 0.00766 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  5.56489E-05 0.00062  5.56367E-05 0.00062  5.76586E-05 0.00765 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  6.82091E-03 0.00579  2.15218E-04 0.03152  1.10823E-03 0.01411  1.06427E-03 0.01491  3.16560E-03 0.00870  9.46854E-04 0.01534  3.20739E-04 0.02741 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  7.69037E-01 0.01401  1.24907E-02 1.7E-06  3.17492E-02 0.00017  1.09785E-01 0.00023  3.18765E-01 0.00018  1.34984E+00 0.00015  8.75086E+00 0.00125 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  5.02045E-05 0.00161  5.01849E-05 0.00161  5.28115E-05 0.01915 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  5.54957E-05 0.00157  5.54740E-05 0.00157  5.83823E-05 0.01914 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  6.82296E-03 0.01757  2.36806E-04 0.09779  1.18176E-03 0.04420  1.03574E-03 0.04634  3.15404E-03 0.02602  8.90517E-04 0.04703  3.24106E-04 0.07990 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  7.64355E-01 0.04228  1.24907E-02 3.7E-06  3.17564E-02 0.00038  1.09750E-01 0.00052  3.18679E-01 0.00049  1.34931E+00 0.00035  8.75211E+00 0.00283 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  6.84093E-03 0.01719  2.36193E-04 0.09709  1.19135E-03 0.04243  1.04440E-03 0.04497  3.14505E-03 0.02544  8.99734E-04 0.04630  3.24200E-04 0.07722 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  7.64679E-01 0.04156  1.24907E-02 3.7E-06  3.17560E-02 0.00037  1.09745E-01 0.00051  3.18686E-01 0.00049  1.34928E+00 0.00035  8.75040E+00 0.00281 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [ -1.36344E+02 0.01768 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  5.03465E-05 0.00046 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  5.56526E-05 0.00028 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  6.82791E-03 0.00345 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [ -1.35657E+02 0.00350 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  9.94015E-07 0.00023 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  2.34883E-06 0.00025  2.34878E-06 0.00025  2.35478E-06 0.00303 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  5.80144E-05 0.00034  5.80133E-05 0.00034  5.81683E-05 0.00419 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  8.18484E-01 0.00015  8.17741E-01 0.00016  9.54521E-01 0.00596 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  1.04966E+01 0.00911 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  4.71308E+01 0.00024  5.13128E+01 0.00033 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:  1])  = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  1.00000E-11  5.00000E-09  1.00000E-08  1.50000E-08  2.00000E-08  2.50000E-08  3.00000E-08  3.50000E-08  4.20000E-08  5.00000E-08  5.80000E-08  6.70000E-08  8.00000E-08  1.00000E-07  1.40000E-07  1.80000E-07  2.20000E-07  2.50000E-07  2.80000E-07  3.00000E-07  3.20000E-07  3.50000E-07  4.00000E-07  5.00000E-07  6.25000E-07  7.80000E-07  8.50000E-07  9.10000E-07  9.50000E-07  9.72000E-07  9.96000E-07  1.02000E-06  1.04500E-06  1.07100E-06  1.09700E-06  1.12300E-06  1.15000E-06  1.30000E-06  1.50000E-06  1.85500E-06  2.10000E-06  2.60000E-06  3.30000E-06  4.00000E-06  9.87700E-06  1.59680E-05  2.77000E-05  4.80520E-05  7.55014E-05  1.48728E-04  3.67262E-04  9.06898E-04  1.42510E-03  2.23945E-03  3.51910E-03  5.50000E-03  9.11800E-03  1.50300E-02  2.47800E-02  4.08500E-02  6.74300E-02  1.11000E-01  1.83000E-01  3.02500E-01  5.00000E-01  8.21000E-01  1.35300E+00  2.23100E+00  3.67900E+00  6.06550E+00  2.00000E+01 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  7.68648E+04 0.00181  2.99672E+05 0.00108  5.94182E+05 0.00072  6.18034E+05 0.00051  5.32545E+05 0.00050  5.05618E+05 0.00051  3.46357E+05 0.00059  2.91812E+05 0.00051  2.24963E+05 0.00051  1.84507E+05 0.00048  1.59860E+05 0.00049  1.43727E+05 0.00051  1.33612E+05 0.00052  1.27496E+05 0.00060  1.24940E+05 0.00050  1.08164E+05 0.00047  1.07751E+05 0.00064  1.06916E+05 0.00056  1.05956E+05 0.00066  2.09243E+05 0.00039  2.05888E+05 0.00040  1.52149E+05 0.00047  1.00152E+05 0.00063  1.19725E+05 0.00050  1.17140E+05 0.00056  1.03954E+05 0.00057  1.86070E+05 0.00036  4.10506E+04 0.00090  5.13482E+04 0.00073  4.65366E+04 0.00087  2.72041E+04 0.00102  4.71649E+04 0.00077  3.21871E+04 0.00108  2.76704E+04 0.00094  5.33846E+03 0.00247  5.30096E+03 0.00200  5.43832E+03 0.00232  5.58826E+03 0.00212  5.52705E+03 0.00220  5.43427E+03 0.00241  5.64690E+03 0.00221  5.29492E+03 0.00227  1.00104E+04 0.00162  1.59985E+04 0.00121  2.03495E+04 0.00132  5.39378E+04 0.00085  5.78888E+04 0.00085  6.71999E+04 0.00083  5.08426E+04 0.00092  4.08935E+04 0.00102  3.27705E+04 0.00085  4.05574E+04 0.00076  8.18235E+04 0.00083  1.16917E+05 0.00051  2.36285E+05 0.00053  3.82257E+05 0.00050  5.93599E+05 0.00048  3.88123E+05 0.00050  2.81087E+05 0.00046  2.03298E+05 0.00053  1.83691E+05 0.00050  1.81829E+05 0.00044  1.52244E+05 0.00050  1.03441E+05 0.00054  9.57086E+04 0.00052  8.54966E+04 0.00048  7.26268E+04 0.00047  5.74146E+04 0.00050  3.87044E+04 0.00063  1.38659E+04 0.00079 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  1.16504E+00 0.00033 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  5.40136E+14 0.00032  3.00125E+14 0.00027 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  5.58546E-01 8.4E-05  1.64559E+00 4.7E-05 ];
INF_CAPT                  (idx, [1:   4]) = [  3.12672E-03 0.00071  2.23520E-02 8.3E-05 ];
INF_ABS                   (idx, [1:   4]) = [  4.35157E-03 0.00055  4.55212E-02 0.00017 ];
INF_FISS                  (idx, [1:   4]) = [  1.22485E-03 0.00046  2.31693E-02 0.00026 ];
INF_NSF                   (idx, [1:   4]) = [  3.14499E-03 0.00045  5.64565E-02 0.00026 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.56765E+00 3.9E-05  2.43670E+00 1.9E-09 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.03840E+02 3.6E-06  2.02270E+02 0.0E+00 ];
INF_INVV                  (idx, [1:   4]) = [  6.39381E-08 0.00020  2.66793E-06 5.6E-05 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  5.54195E-01 8.7E-05  1.60006E+00 4.8E-05 ];
INF_SCATT1                (idx, [1:   4]) = [  2.96996E-01 0.00011  4.29746E-01 0.00013 ];
INF_SCATT2                (idx, [1:   4]) = [  1.15728E-01 0.00018  1.00130E-01 0.00042 ];
INF_SCATT3                (idx, [1:   4]) = [  6.69250E-03 0.00250  3.00035E-02 0.00138 ];
INF_SCATT4                (idx, [1:   4]) = [ -1.49347E-02 0.00115 -1.01982E-02 0.00291 ];
INF_SCATT5                (idx, [1:   4]) = [ -9.63963E-04 0.01772  7.47424E-03 0.00387 ];
INF_SCATT6                (idx, [1:   4]) = [  5.76857E-03 0.00220 -1.90612E-02 0.00140 ];
INF_SCATT7                (idx, [1:   4]) = [  7.67481E-04 0.01427  7.09779E-04 0.03168 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  5.54219E-01 8.6E-05  1.60006E+00 4.8E-05 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.96997E-01 0.00011  4.29746E-01 0.00013 ];
INF_SCATTP2               (idx, [1:   4]) = [  1.15728E-01 0.00018  1.00130E-01 0.00042 ];
INF_SCATTP3               (idx, [1:   4]) = [  6.69245E-03 0.00251  3.00035E-02 0.00138 ];
INF_SCATTP4               (idx, [1:   4]) = [ -1.49346E-02 0.00115 -1.01982E-02 0.00291 ];
INF_SCATTP5               (idx, [1:   4]) = [ -9.63931E-04 0.01771  7.47424E-03 0.00387 ];
INF_SCATTP6               (idx, [1:   4]) = [  5.76856E-03 0.00220 -1.90612E-02 0.00140 ];
INF_SCATTP7               (idx, [1:   4]) = [  7.67584E-04 0.01429  7.09779E-04 0.03168 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  1.72544E-01 0.00024  1.05390E+00 7.1E-05 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.93188E+00 0.00024  3.16284E-01 7.1E-05 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  4.32838E-03 0.00055  4.55212E-02 0.00017 ];
INF_REMXS                 (idx, [1:   4]) = [  3.02929E-02 0.00014  4.62315E-02 0.00033 ];

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

INF_S0                    (idx, [1:   8]) = [  5.28253E-01 8.5E-05  2.59423E-02 0.00018  7.02108E-04 0.00243  1.59936E+00 4.9E-05 ];
INF_S1                    (idx, [1:   8]) = [  2.89237E-01 0.00011  7.75938E-03 0.00055  3.70581E-04 0.00333  4.29375E-01 0.00013 ];
INF_S2                    (idx, [1:   8]) = [  1.17940E-01 0.00018 -2.21255E-03 0.00182  2.01396E-04 0.00472  9.99290E-02 0.00042 ];
INF_S3                    (idx, [1:   8]) = [  9.38393E-03 0.00173 -2.69143E-03 0.00097  7.19273E-05 0.01028  2.99316E-02 0.00138 ];
INF_S4                    (idx, [1:   8]) = [ -1.40134E-02 0.00118 -9.21237E-04 0.00320  5.14400E-07 1.00000 -1.01988E-02 0.00291 ];
INF_S5                    (idx, [1:   8]) = [ -9.77486E-04 0.01766  1.35237E-05 0.18612 -2.86581E-05 0.02181  7.50290E-03 0.00384 ];
INF_S6                    (idx, [1:   8]) = [  5.97435E-03 0.00219 -2.05780E-04 0.00853 -3.69933E-05 0.01541 -1.90242E-02 0.00139 ];
INF_S7                    (idx, [1:   8]) = [  1.01311E-03 0.01028 -2.45625E-04 0.00831 -3.23652E-05 0.02089  7.42145E-04 0.03035 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  5.28276E-01 8.5E-05  2.59423E-02 0.00018  7.02108E-04 0.00243  1.59936E+00 4.9E-05 ];
INF_SP1                   (idx, [1:   8]) = [  2.89237E-01 0.00011  7.75938E-03 0.00055  3.70581E-04 0.00333  4.29375E-01 0.00013 ];
INF_SP2                   (idx, [1:   8]) = [  1.17940E-01 0.00018 -2.21255E-03 0.00182  2.01396E-04 0.00472  9.99290E-02 0.00042 ];
INF_SP3                   (idx, [1:   8]) = [  9.38388E-03 0.00174 -2.69143E-03 0.00097  7.19273E-05 0.01028  2.99316E-02 0.00138 ];
INF_SP4                   (idx, [1:   8]) = [ -1.40134E-02 0.00118 -9.21237E-04 0.00320  5.14400E-07 1.00000 -1.01988E-02 0.00291 ];
INF_SP5                   (idx, [1:   8]) = [ -9.77455E-04 0.01765  1.35237E-05 0.18612 -2.86581E-05 0.02181  7.50290E-03 0.00384 ];
INF_SP6                   (idx, [1:   8]) = [  5.97434E-03 0.00219 -2.05780E-04 0.00853 -3.69933E-05 0.01541 -1.90242E-02 0.00139 ];
INF_SP7                   (idx, [1:   8]) = [  1.01321E-03 0.01030 -2.45625E-04 0.00831 -3.23652E-05 0.02089  7.42145E-04 0.03035 ];

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

CMM_TRANSPXS              (idx, [1:   4]) = [  2.01862E-01 0.00037  1.00281E+00 0.00115 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  1.96166E-01 0.00069  9.92981E-01 0.00175 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  1.96218E-01 0.00057  9.92175E-01 0.00196 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  2.14254E-01 0.00056  1.02425E+00 0.00194 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  1.65130E+00 0.00037  3.32423E-01 0.00115 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  1.69928E+00 0.00069  3.35740E-01 0.00176 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  1.69882E+00 0.00057  3.36026E-01 0.00197 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  1.55581E+00 0.00056  3.25501E-01 0.00193 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  6.85775E-03 0.00542  2.18002E-04 0.02990  1.12758E-03 0.01341  1.06068E-03 0.01352  3.15696E-03 0.00793  9.68790E-04 0.01511  3.25738E-04 0.02497 ];
LAMBDA                    (idx, [1:  14]) = [  7.73294E-01 0.01259  1.24907E-02 1.5E-06  3.17409E-02 0.00016  1.09786E-01 0.00022  3.18767E-01 0.00016  1.34989E+00 0.00012  8.75536E+00 0.00109 ];

