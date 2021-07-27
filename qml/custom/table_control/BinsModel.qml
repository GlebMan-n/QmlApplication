pragma Singleton

import QtQuick 2.15
import QtQml.Models 2.15

Item {
    id:root
    property alias model: _model
    property var copyPasteDay
    property var copyPasteBin
    property var cutPasteMediModel
    property var cutPasteMedi
    property var cutPasteMediIndex
    property int copyDay: -1
    ListModel {
        id:_model
        ListElement
        {
            plane: [
                ListElement {
                    day: "12.15.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "10:00AM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },

                        ListElement {
                            name: "Bin #"
                            time: "03:00PM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                /* ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                                                 medi_qty : 1
                                                                 medi_freq: "TID"
                                                                 medi_prn: 0
                                                    },*/

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },

                        ListElement {
                            name: "Bin #"
                            time: "09:00PM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        }

                    ]
                },
                ListElement {
                    day: "12.16.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "10:00AM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },

                        ListElement {
                            name: "Bin #"
                            time: "03:00PM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                /* ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                                                 medi_qty : 1
                                                                 medi_freq: "TID"
                                                                 medi_prn: 0
                                                    },*/

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },

                        ListElement {
                            name: "Bin #"
                            time: "09:00PM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        }

                    ]
                },
                ListElement {
                    day: "12.17.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "10:00AM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },

                        ListElement {
                            name: "Bin #"
                            time: "03:00PM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                /* ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                                                 medi_qty : 1
                                                                 medi_freq: "TID"
                                                                 medi_prn: 0
                                                    },*/

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },

                        ListElement {
                            name: "Bin #"
                            time: "09:00PM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },

                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        }
                    ]
                }                       ,
                ListElement {
                    day: "12.17.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "10:00AM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "03:00PM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                /* ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                                                 medi_qty : 1
                                                                 medi_freq: "TID"
                                                                 medi_prn: 0
                                                    },*/
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "09:00PM"
                            medications: [

                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        }
                    ]
                },
                ListElement {
                    day: "12.18.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "10:00AM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "03:00PM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                /* ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                                                 medi_qty : 1
                                                                 medi_freq: "TID"
                                                                 medi_prn: 0
                                                    },*/
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "09:00PM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        }
                    ]
                },
                ListElement {
                    day: "12.19.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "10:00AM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "03:00PM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                /* ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                                                 medi_qty : 1
                                                                 medi_freq: "TID"
                                                                 medi_prn: 0
                                                    },*/
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "09:00PM"
                            medications: [
                                ListElement { medi_name: "HYDROcodone Bitartrate C12A 30 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Ezetimibe-Simvastatin TABS 10-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                },
                                ListElement { medi_name: "Lisinopril TABS 20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 0
                                }
                            ]
                        }
                    ]
                }
            ]
        }
       /* ListElement {
            plane_prn: [
                ListElement {
                    day: "12.15.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "9:00AM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "3:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "9:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        }
                    ]
                },
                ListElement {
                    day: "12.15.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "9:00AM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "3:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "9:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        }
                    ]
                },
                ListElement {
                    day: "12.16.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "9:00AM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "3:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "9:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        }
                    ]
                },
                ListElement {
                    day: "12.17.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "9:00AM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "3:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "9:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        }
                    ]
                },
                ListElement {
                    day: "12.18.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "9:00AM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "3:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "9:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        }
                    ]
                },
                ListElement {
                    day: "12.19.2020"
                    bins: [
                        ListElement {
                            name: "Bin #"
                            time: "9:00AM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "3:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        },
                        ListElement {
                            name: "Bin #"
                            time: "9:00PM"
                            medications: [
                                ListElement { medi_name: "Levothyroxine Sodium CAPS 100 MCG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                },
                                ListElement { medi_name: "Amoxicill-Clarithro-Omeprazole MISC 500-500-20 MG"
                                    medi_qty : 1
                                    medi_freq: "TID"
                                    medi_prn: 1
                                }
                            ]
                        }
                    ]
                }

            ]

        }*/
    }
}
